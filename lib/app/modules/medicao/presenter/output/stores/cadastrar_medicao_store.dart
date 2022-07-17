import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/save_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/update_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/external/datasource/medicao_firestore_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/external/data_source/regra_firestore_datasource_impl.dart';
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
      descricao = medicao!.descricao;
      selectedDate = medicao!.dataMedicao;
      identificador = medicao!.identificador;
    }
  }

  @observable
  String identificador = '';

  @action
  void setIdentificador(String value) => identificador = value;

  @computed
  bool get identificadorIsValid => identificador.isNotEmpty;
  String? get identificadorError {
    if (identificadorIsValid) {
      return null;
    } else if (identificador.isEmpty) {
      return null;
    }
  }

  @observable
  DateTime? selectedDate = DateTime.now();

  @action
  void setSelectedDate(DateTime? value) => selectedDate = value;

  @observable
  String descricao = '';

  @action
  void setDescricao(String value) => descricao = value;

  @computed
  bool get descricaoIsValid => descricao.isNotEmpty;
  String? get descricaoError {
    if (descricaoIsValid) {
      return null;
    } else if (descricao.isEmpty) {
      return null;
    } else {
      return 'Descrição inválida';
    }
  }

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
      return null;
    } else if (nomeResponsavel.length < 6) {
      return 'Nome inválido';
    }
  }

  @computed
  bool get isFormValid =>
      nomeResponsavelIsValid && identificadorIsValid && descricaoIsValid;

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
      identificador: identificador,
      nomeResponsavel: nomeResponsavel,
      descricao: descricao,
      dataMedicao: selectedDate,
      anoMedicao: selectedDate!.year,
    );

    if (!await validarMedicoesPorIdade(medicaoSaved)) {
      loading = false;
      return;
    }

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
      identificador: identificador,
      nomeResponsavel: nomeResponsavel,
      descricao: descricao,
      dataMedicao: selectedDate,
      anoMedicao: selectedDate!.year,
    );

    if (!await validarMedicoesPorIdade(medicaoUpdate)) {
      loading = false;
      return;
    }

    try {
      await usecase.call(medicaoUpdate);
      updatedMedicao = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  Future<bool> validarMedicoesPorIdade(final Medicao medicao) async {
    final datasource = Modular.get<MedicaoFirestoreDatasourceImpl>();
    final regraDatasource = Modular.get<RegraFirestoreDatasourceImpl>();
    final authStore = Modular.get<AuthStore>();

    final responseRegra = await regraDatasource.regraEstaAtiva(
        uuid: authStore.user!.uid,
        validacao: ValidacaoConsistenciaEnum.VIDADEDOISMENOSIDADEUMIGUALAUM);

    if (responseRegra.ok && responseRegra.result == true) {
      print(
          'Regra >> VIDADEDOISMENOSIDADEUMIGUALAUM << ativa? ${responseRegra.result}');
      final apiResponse =
          await datasource.obterUltimaMedicaoByParcelaId(medicao.parcelaId);
      if (apiResponse.ok && apiResponse.result != null) {
        final Medicao medicaoAnterior = apiResponse.result;
        final anoAtual = medicao.anoMedicao;
        final anoAnterior = medicaoAnterior.anoMedicao;
        print('anoAtual=$anoAtual <-> anoAnterior=$anoAnterior');

        try {
          if ((anoAtual! - anoAnterior!) != 1) {
            print('Idade da medicao atual maior que 1 ano');
            error =
                'Erro de consistência: A diferença entre Medições precisa ser de 1 ano';
            return false;
          }
        } catch (e) {
          error =
              'Erro ao verificar regra de consistência da idade das Medições';
          return false;
        }
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
}
