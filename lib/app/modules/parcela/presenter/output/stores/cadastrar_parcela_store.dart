import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/save_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/update_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/external/datasource/parcela_firestore_datasource.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/external/data_source/regra_firestore_datasource_impl.dart';
import 'package:forestinv_mobile/helper/location_helper.dart';
import 'package:mobx/mobx.dart';
import 'package:time_machine/time_machine.dart';
part 'cadastrar_parcela_store.g.dart';

class CadastrarParcelaStore = _CadastrarParcelaStoreBase
    with _$CadastrarParcelaStore;

abstract class _CadastrarParcelaStoreBase with Store {
  final List? args;
  Parcela? parcela;
  final int YEAR = 12;

  _CadastrarParcelaStoreBase({this.args}) {
    if (args?[0] != null) {
      parcela = args![0];
      identificadorParcela = parcela!.identificadorParcela;
      areaParcela = parcela!.areaParcela.toString();
      identificadorTalhao = parcela!.identificadorTalhao;
      areaTalhao = parcela!.areaTalhao.toString();
      espacamento = parcela!.espacamento.toString();
      latitude = parcela!.latitude.toString();
      longitude = parcela!.longitude.toString();
    }
  }

  @observable
  DateTime? selectedDate = DateTime.now();

  @action
  void setSelectedDate(DateTime? value) => selectedDate = value;

  @observable
  String identificadorParcela = '';

  @action
  void setIdentificadorParcela(String value) => identificadorParcela = value;

  @computed
  bool get identificadorParcelaIsValid => identificadorParcela.isNotEmpty;
  String? get identificadorParcelaError {
    if (identificadorParcelaIsValid) {
      return null;
    } else if (identificadorParcela.isEmpty) {
      return null;
    }
  }

  @observable
  String areaParcela = '';

  @action
  void setAreaParcela(String value) => areaParcela = value;

  @computed
  bool get areaParcelaIsValid => areaParcela.isNotEmpty;
  String? get areaParcelaError {
    if (areaParcelaIsValid) {
      return null;
    } else if (areaParcela.isEmpty) {
      return null;
    } else {
      return 'Área inválida';
    }
  }

  @observable
  String identificadorTalhao = '';

  @action
  void setIdentificadorTalhao(String value) => identificadorTalhao = value;

  @computed
  bool get identificadorTalhaoIsValid => identificadorTalhao.isNotEmpty;
  String? get identificadorTalhaoError {
    if (identificadorTalhaoIsValid) {
      return null;
    } else if (identificadorTalhao.isEmpty) {
      return null;
    }
  }

  @observable
  String areaTalhao = '';

  @action
  void setAreaTalhao(String value) => areaTalhao = value;

  @computed
  bool get areaTalhaoIsValid => areaTalhao.isNotEmpty;
  String? get areaTalhaoError {
    if (areaTalhaoIsValid) {
      return null;
    } else if (areaTalhao.isEmpty) {
      return null;
    } else {
      return 'Área inválida';
    }
  }

  @observable
  String espacamento = '';

  @action
  void setEspacamento(String value) => espacamento = value;

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

  @computed
  bool get espacamentoIsValid => espacamento.isNotEmpty;
  String? get espacamentoError {
    if (espacamentoIsValid) {
      return null;
    } else if (espacamento.isEmpty) {
      return null;
    }
  }

  @computed
  bool get isFormValid =>
      identificadorParcelaIsValid &&
      areaParcelaIsValid &&
      identificadorTalhaoIsValid &&
      areaTalhaoIsValid &&
      espacamentoIsValid;

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
  bool savedParcela = false;

  @observable
  bool updatedParcela = false;

  @action
  Future<void> _cadastrar() async {
    loading = true;
    final usecase = Modular.get<SaveParcelaUsecase>();
    final projetoId = args![1];

    final parcelaSaved = Parcela(
      projetoId: projetoId,
      identificadorParcela: identificadorParcela,
      areaParcela: double.parse(areaParcela),
      largura: double.parse('1'),
      identificadorTalhao: identificadorTalhao,
      areaTalhao: double.parse(areaTalhao),
      latitude: latitude,
      longitude: longitude,
      dataPlantio: selectedDate!,
      idadeParcela: calcularIdadeParcela(selectedDate!),
      espacamento: espacamento,
      tipoParcelaEnum: 'Permanente',
    );

    if (!await validarEspacamentoPorIdade(parcelaSaved)) {
      loading = false;
      return;
    }

    try {
      await usecase.call(parcelaSaved);
      savedParcela = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _editar() async {
    loading = true;
    final usecase = Modular.get<UpdateParcelaUsecase>();

    final parcelaUpdated = Parcela(
      id: parcela!.id,
      identificadorParcela: identificadorParcela,
      areaParcela: double.parse(areaParcela),
      largura: double.parse('1'),
      identificadorTalhao: identificadorTalhao,
      areaTalhao: double.parse(areaTalhao),
      latitude: latitude,
      longitude: longitude,
      dataPlantio: selectedDate!,
      idadeParcela: calcularIdadeParcela(selectedDate!),
      espacamento: espacamento,
      tipoParcelaEnum: 'Permanente',
    );

    if (!await validarEspacamentoPorIdade(parcelaUpdated)) {
      loading = false;
      return;
    }

    try {
      await usecase.call(parcelaUpdated);
      updatedParcela = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  Future<bool> validarEspacamentoPorIdade(final Parcela parcela) async {
    final datasource = Modular.get<ParcelaFirestoreDatasourceImpl>();
    final regraDatasource = Modular.get<RegraFirestoreDatasourceImpl>();
    final authStore = Modular.get<AuthStore>();

    final responseRegra = await regraDatasource.regraEstaAtiva(
        uuid: authStore.user!.uid,
        validacao: ValidacaoConsistenciaEnum.VESPPARCELADIFIDADE);

    if (responseRegra.ok && responseRegra.result == true) {
      print('Regra >> VESPPARCELADIFIDADE << ativa? ${responseRegra.result}');
      final List<Parcela> parcelasList =
          await datasource.listAllByProject(parcela.projetoId);
      if (parcelasList.isNotEmpty) {
        print('Parcelas size: ${parcelasList.length}');

        if (!isValidEspacamentos(parcela, parcelasList)) {
          print('Espacamento diferente');
          error =
              'Erro de consistência: Espaçamento diferente das outras parcelas';
          return false;
        }
      }
    }
    print('Espacamento igual');
    // setIsDapValid(true);
    return true;
  }

  bool isValidEspacamentos(
      final Parcela parcela, final List<Parcela> parcelasList) {
    for (final element in parcelasList) {
      if (element.espacamento != parcela.espacamento) {
        return false;
      }
    }
    return true;
  }

  @action
  Future<void> openDatePicker(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(1970),
        lastDate: DateTime(2025),
        locale: const Locale('pt', 'BR'));

    if (selected != null && selected != selectedDate) {
      setSelectedDate(selected);
    }
  }

  int calcularIdadeParcela(DateTime dataPlantio) {
    final LocalDate a = LocalDate.today();
    final LocalDate b = LocalDate.dateTime(dataPlantio);
    final Period diff = b.periodSince(a);
    print("years: ${diff.years}; months: ${diff.months}; days: ${diff.days}");

    return diff.years == 0 ? YEAR : (diff.years * YEAR * -1);
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
}
