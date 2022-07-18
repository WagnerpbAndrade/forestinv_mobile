import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/get_all_by_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/save_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/save_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/update_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/external/datasource/medicao_firestore_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/external/data_source/regra_firestore_datasource_impl.dart';
import 'package:mobx/mobx.dart';
import 'package:forestinv_mobile/helper/extensions.dart';

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

    String medicaoIdAdd = '';
    try {
      final ApiResponse = await usecase.call(medicaoSaved);
      medicaoIdAdd = ApiResponse.result;
      savedMedicao = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    if (savedMedicao) {
      final datasource = Modular.get<MedicaoFirestoreDatasourceImpl>();
      final getArvoresUsecase = Modular.get<GetAllByMedicaoUsecase>();

      final apiResponse = await datasource.obterUltimaMedicaoByParcelaId(
          parcelaId, (medicaoSaved.anoMedicao! - 1).toString());

      if (apiResponse.ok && apiResponse.result != null) {
        final Medicao medicaoAnterior = apiResponse.result;
        final listArvoreByMedicao =
            await getArvoresUsecase.getAllByMedicao(medicaoAnterior.id);
        final arvoresListNova =
            _getListNovaMedicao(listArvoreByMedicao, medicaoIdAdd);
        _salvarArvoresNovas(arvoresListNova);
      }
    }

    loading = false;
  }

  void _salvarArvoresNovas(final List<Arvore> arvores) async {
    final usecase = Modular.get<SaveArvoreUsecase>();
    for (final arvore in arvores) {
      await usecase.save(arvore);
    }
  }

  List<Arvore> _getListNovaMedicao(
      final List<Arvore> listaAntiga, final String medicaoIdNovo) {
    final list = <Arvore>[];
    for (final element in listaAntiga) {
      final arvore = element.copyWith(medicaoId: medicaoIdNovo);
      list.add(arvore);
    }
    return list;
  }

  @action
  Future<void> _editar() async {
    loading = true;
    final usecase = Modular.get<UpdateMedicaoUsecase>();

    final medicaoUpdate = Medicao(
      id: medicao!.id,
      parcelaId: medicao!.parcelaId,
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
          await datasource.obterUltimaMedicaoByParcelaIdOrderByAnoMedicaoDesc(
              medicao.parcelaId);
      if (apiResponse.ok && apiResponse.result != null) {
        final Medicao medicaoAnterior = apiResponse.result;
        final anoAtual = medicao.dataMedicao;
        final anoAnterior = medicaoAnterior.dataMedicao;
        print('anoAtual=$anoAtual <-> anoAnterior=$anoAnterior');

        final diffIdade = _diffMedicaoAtualMenosAnterior(
            medicao.dataMedicao, medicaoAnterior.dataMedicao);

        try {
          if (diffIdade != 1) {
            print('Idade da medicao atual maior que 1 ano');
            error =
                'Erro de consistência: A diferença entre Medições precisa ser de 1 ano. Próxima medição a partir de: ${DateTime(medicaoAnterior.dataMedicao!.year + 1, medicaoAnterior.dataMedicao!.month, medicaoAnterior.dataMedicao!.day).formattedDate()}';
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

  int _diffMedicaoAtualMenosAnterior(
      DateTime? medicaoAtual, DateTime? dataAnterior) {
    final Duration duration = medicaoAtual!.difference(dataAnterior!);
    final int differenceInDays = (duration.inDays / 365).floor();
    final differenceInYears = (duration.inDays / 365).floor();
    print('years: $differenceInYears');
    return differenceInYears;
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
