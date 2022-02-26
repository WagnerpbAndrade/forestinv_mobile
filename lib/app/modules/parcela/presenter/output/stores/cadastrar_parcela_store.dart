import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/save_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/update_parcela_usecase.dart';
import 'package:mobx/mobx.dart';
part 'cadastrar_parcela_store.g.dart';

class CadastrarParcelaStore = _CadastrarParcelaStoreBase
    with _$CadastrarParcelaStore;

abstract class _CadastrarParcelaStoreBase with Store {
  final List? args;
  Parcela? parcela;

  _CadastrarParcelaStoreBase({required this.args}) {
    if (args?[0] != null) {
      parcela = args![0];
      numero = parcela!.numero.toString();
      area = parcela!.area.toString();
      numeroTalhao = parcela!.numTalhao.toString();
      espacamento = parcela!.espacamento.toString();
    }
  }

  @observable
  String numero = '';

  @action
  void setNumero(String value) => numero = value;

  @computed
  bool get numeroIsValid => numero.isNotEmpty;
  String? get numeroError {
    if (numeroIsValid) {
      return null;
    } else if (numero.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  @observable
  String area = '';

  @action
  void setArea(String value) => area = value;

  @computed
  bool get areaIsValid => area.isNotEmpty;
  String? get areaError {
    if (areaIsValid) {
      return null;
    } else if (area.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Área inválida';
    }
  }

  @observable
  String numeroTalhao = '';

  @action
  void setNumeroTalhao(String value) => numeroTalhao = value;

  @computed
  bool get numeroTalhaoIsValid => numeroTalhao.isNotEmpty;
  String? get numeroTalhaoError {
    if (numeroTalhaoIsValid) {
      return null;
    } else if (numeroTalhao.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  @observable
  String espacamento = '';

  @action
  void setEspacamento(String value) => espacamento = value;

  @computed
  bool get espacamentoIsValid => espacamento.isNotEmpty;
  String? get espacamentoError {
    if (espacamentoIsValid) {
      return null;
    } else if (espacamento.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  @computed
  bool get isFormValid =>
      numeroIsValid && areaIsValid && numeroTalhaoIsValid && espacamentoIsValid;

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
      numero: int.parse(numero),
      area: double.parse(area),
      largura: double.parse('1'),
      numTalhao: int.parse(numeroTalhao),
      latitude: 'latitude',
      longitude: 'longitude',
      dataPlantio: DateTime.now(),
      espacamento: espacamento,
      tipoParcelaEnum: 'Permanente',
    );

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
      numero: int.parse(numero),
      area: double.parse(area),
      largura: double.parse('1'),
      numTalhao: int.parse(numeroTalhao),
      latitude: 'latitude',
      longitude: 'longitude',
      dataPlantio: DateTime.now(),
      espacamento: espacamento,
      tipoParcelaEnum: 'Permanente',
    );

    try {
      await usecase.call(parcelaUpdated);
      updatedParcela = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
