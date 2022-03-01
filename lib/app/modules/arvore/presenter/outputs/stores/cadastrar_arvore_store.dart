import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/estado_arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/save_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/update_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/external/datasource/arvore_firestore_datasource.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/external/data_source/regra_firestore_datasource_impl.dart';
import 'package:forestinv_mobile/helper/location_helper.dart';
import 'package:mobx/mobx.dart';
part 'cadastrar_arvore_store.g.dart';

class CadastrarArvoreStore = _CadastrarArvoreStoreBase
    with _$CadastrarArvoreStore;

abstract class _CadastrarArvoreStoreBase with Store {
  final List? args;
  Arvore? arvore;

  _CadastrarArvoreStoreBase({this.args}) {
    if (args?[0] != null) {
      arvore = args?[0];
      numeroArvore = arvore!.numArvore.toString();
      dapText = arvore!.dap.toString();
      alturaText = arvore!.alturaTotal.toString();
      observacao = arvore!.observacao;
      latitude = arvore!.latitude;
      longitude = arvore!.longitude;
    }
  }

  @observable
  DateTime? selectedDate = DateTime.now();

  @action
  void setSelectedDate(DateTime? value) => selectedDate = value;

  @observable
  String numeroArvore = '';

  @action
  void setNumeroArvore(String value) => numeroArvore = value;

  @computed
  bool get numeroArvoreIsValid => numeroArvore.isNotEmpty;
  String? get numeroArvoreError {
    if (numeroArvoreIsValid) {
      return null;
    } else if (numeroArvore.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  @observable
  String dapText = '';

  @action
  void setDapText(String value) => dapText = value;

  @computed
  num get dap {
    if (dapText.contains(',')) {
      return num.tryParse(dapText.replaceAll(RegExp('[^0-9]'), ''))! / 100;
    } else {
      return num.tryParse(dapText)!;
    }
  }

  @computed
  bool get dapValid => dapText.isNotEmpty && dap > 0;
  String? get dapError {
    if (dapValid) {
      return null;
    } else if (dapText.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'DAP inválido';
    }
  }

  @observable
  String alturaText = '';

  @action
  void setAlturaText(String value) => alturaText = value;

  @computed
  num get altura {
    if (alturaText.contains(',')) {
      return num.tryParse(alturaText.replaceAll(RegExp('[^0-9]'), ''))! / 100;
    } else {
      return num.tryParse(alturaText)!;
    }
  }

  bool get alturaValid => alturaText.isNotEmpty && altura > 0;
  String? get alturaError {
    if (alturaValid) {
      return null;
    } else if (alturaText.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Altura inválida';
    }
  }

  @observable
  String latitude = '';

  @action
  void setLatitude(String value) => latitude = value;

  @observable
  String longitude = '';

  @action
  void setLongitude(String value) => longitude = value;

  @observable
  bool loadingLatLong = false;

  @observable
  String observacao = '';

  @action
  void setObservacao(String value) => observacao = value;

  @observable
  EstadoArvore? estadoArvore;

  @action
  void setEstadoArvore(EstadoArvore value) => estadoArvore = value;

  @computed
  bool get estadoArvoreValid => estadoArvore != null;
  String? get estadoArvoreError {
    if (estadoArvoreValid) {
      return null;
    } else {
      return 'Campo obrigatório';
    }
  }

  @computed
  bool get isFormValid =>
      numeroArvoreIsValid && dapValid && alturaValid && estadoArvoreValid;

  @computed
  Function? get cadastrarOnPressed =>
      (isFormValid && !loading) ? _cadastrar : null;

  @computed
  Function? get editarOnPressed => (isFormValid && !loading) ? _editar : null;

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  bool savedArvore = false;

  @observable
  bool updatedArvore = false;

  @observable
  bool isDapValid = false;

  @action
  void setIsDapValid(bool value) => isDapValid = value;

  @action
  Future<void> _cadastrar() async {
    loading = true;
    final usecase = Modular.get<SaveArvoreUsecase>();
    final datasource = Modular.get<ArvoreFirestoreDatasourceImpl>();
    final Medicao medicao = args![1];

    final arvoreSaved = Arvore(
      medicaoId: medicao.id,
      parcelaId: medicao.parcelaId,
      numArvore: int.parse(numeroArvore),
      dap: double.parse(dapText),
      alturaTotal: double.parse(alturaText),
      estadoArvore: EstadoArvoreEnum.values.elementAt(estadoArvore!.index),
      estadoDescription: estadoArvore!.description,
      latitude: latitude,
      longitude: longitude,
      observacao: observacao,
      dataCriacao: DateTime.now(),
    );

    if (await datasource.arvoreIsExists(medicao.id, arvoreSaved)) {
      loading = false;
      error = 'A árvore com o número $numeroArvore já está cadastrada';
      return;
    }

    if (!await validarDapAnterior(arvoreSaved)) {
      loading = false;
      return;
    }

    if (!await validarEstadoAnterior(arvoreSaved)) {
      loading = false;
      return;
    }

    try {
      await usecase.save(arvoreSaved);
      savedArvore = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _editar() async {
    loading = true;
    final usecase = Modular.get<UpdateArvoreUsecase>();

    final arvoreUpdated = Arvore(
      id: arvore!.id,
      numArvore: int.parse(numeroArvore),
      dap: double.parse(dapText),
      alturaTotal: double.parse(alturaText),
      estadoArvore: EstadoArvoreEnum.values.elementAt(estadoArvore!.index),
      estadoDescription: estadoArvore!.description,
      latitude: latitude,
      longitude: longitude,
      observacao: observacao,
      dataCriacao: arvore!.dataCriacao,
      ultimaAtualizacao: DateTime.now(),
    );

    if (!await validarDapAnterior(arvoreUpdated)) {
      loading = false;
      return;
    }

    if (!await validarEstadoAnterior(arvoreUpdated)) {
      loading = false;
      return;
    }

    try {
      await usecase.update(arvoreUpdated);
      updatedArvore = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  Future<void> getLatLong() async {
    loadingLatLong = true;

    final locationHelper = Modular.get<LocationHelper>();

    final position = await locationHelper.getPosition().catchError((error) {
      print('Error: $error');
      error = error.toString();
    });

    print('Latitude: ${position.latitude}');
    print('Longitude: ${position.longitude}');

    setLatitude(position.latitude.toString());
    setLongitude(position.longitude.toString());

    loadingLatLong = false;
  }

  Future<bool> validarDapAnterior(final Arvore arvore) async {
    final datasource = Modular.get<ArvoreFirestoreDatasourceImpl>();
    final regraDatasource = Modular.get<RegraFirestoreDatasourceImpl>();
    final authStore = Modular.get<AuthStore>();

    final responseRegra = await regraDatasource.regraEstaAtiva(
        uuid: authStore.getUser().uid,
        validacao: ValidacaoConsistenciaEnum.VMEDICAODAPANTERIOR);

    if (responseRegra.ok && responseRegra.result == true) {
      print('Regra Dap Anterior: ${responseRegra.result}');
      final responseArvore = await datasource.obterArvoreAnoAnterior(arvore);
      if (responseArvore.ok) {
        print('Arvore Ano Anterior: ${responseArvore.result}');
        final Arvore arvoreResult = responseArvore.result;
        final dapAnterior = arvoreResult.dap;
        final dapAtual = arvore.dap;

        if (dapAtual < dapAnterior) {
          print('Dap atual é menor');
          error =
              'Erro de consistência: O dap atual é menor que o dap de ${arvoreResult.dataCriacao?.year}';
          setIsDapValid(false);
          return false;
        }
      }
    }
    print('Dap atual é maior');
    setIsDapValid(true);
    return true;
  }

  Future<bool> validarEstadoAnterior(final Arvore arvore) async {
    final datasource = Modular.get<ArvoreFirestoreDatasourceImpl>();
    final regraDatasource = Modular.get<RegraFirestoreDatasourceImpl>();
    final authStore = Modular.get<AuthStore>();

    final responseRegra = await regraDatasource.regraEstaAtiva(
        uuid: authStore.getUser().uid,
        validacao: ValidacaoConsistenciaEnum.VESTINVALIDO);

    if (responseRegra.ok && responseRegra.result == true) {
      print('Regra estado inválido Anterior: ${responseRegra.result}');
      final responseArvore = await datasource.obterArvoreAnoAnterior(arvore);
      if (responseArvore.ok) {
        print('Arvore Ano Anterior: ${responseArvore.result}');
        final Arvore arvoreResult = responseArvore.result;
        final estadoIsValid = arvoreResult.isEstadoValido(arvore);

        if (!estadoIsValid) {
          print('Estado atual é inválido');
          error =
              'Erro de consistência: O estado atual: ${arvore.estadoDescription.toUpperCase()} é incompatível com o estado anterior : ${arvoreResult.estadoDescription.toUpperCase()}';
          setIsDapValid(false);
          return false;
        }
      }
    }
    print('O estado atual é válido');
    setIsDapValid(true);
    return true;
  }
}
