import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/save_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/update_medicao_usecase.dart';
import 'package:mobx/mobx.dart';

part 'cadastrar_medicao_store.g.dart';

class CadastrarMedicaoStore = _CadastrarMedicaoStoreBase
    with _$CadastrarMedicaoStore;

abstract class _CadastrarMedicaoStoreBase with Store {
  final List? args;
  Medicao? medicao;

  _CadastrarMedicaoStoreBase(this.args) {
    if (args?[0] != null) {
      medicao = args?[0];
      nomeResponsavel = medicao!.nomeResponsavel;
      selectedDate = medicao!.dataMedicao;
      numero = medicao!.numero.toString();
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
  DateTime? selectedDate = DateTime.now();

  @action
  void setSelectedDate(DateTime? value) => selectedDate = value;

  @observable
  String nomeResponsavel = '';

  @action
  void setNomeResponsavel(String value) => nomeResponsavel = value;

  @computed
  bool get nomeResponsavelIsValid => nomeResponsavel.isNotEmpty;
  String? get nomeResponsavelError {
    if (nomeResponsavelIsValid) {
      return null;
    } else if (nomeResponsavel.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  @computed
  bool get isFormValid => nomeResponsavelIsValid && numeroIsValid;

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
  bool savedMedicao = false;

  @observable
  bool updatedMedicao = false;

  @action
  Future<void> _cadastrar() async {
    loading = true;
    final usecase = Modular.get<SaveMedicaoUsecase>();
    final parcelaId = args![1];

    final medicaoSaved = Medicao(
      parcelaId: parcelaId,
      numero: int.parse(numero),
      nomeResponsavel: nomeResponsavel,
      dataMedicao: selectedDate,
      anoMedicao: selectedDate!.year,
    );

    try {
      await usecase.call(medicaoSaved);
      savedMedicao = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _editar() async {
    loading = true;
    final usecase = Modular.get<UpdateMedicaoUsecase>();

    final medicaoUpdate = Medicao(
      id: medicao!.id,
      numero: int.parse(numero),
      nomeResponsavel: nomeResponsavel,
      dataMedicao: selectedDate,
      anoMedicao: selectedDate!.year,
    );

    try {
      await usecase.call(medicaoUpdate);
      updatedMedicao = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
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
}
