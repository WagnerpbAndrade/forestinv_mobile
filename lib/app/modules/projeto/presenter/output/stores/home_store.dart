import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/core/constants/shared_preferences_const.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/delete_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/pages/cadastrar_projeto_page.dart';
import 'package:forestinv_mobile/app/stores/settings_store.dart';
import 'package:forestinv_mobile/helper/csv_helper.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {
    autorun((_) async {
      setLoading(true);

      final settingsStore = Modular.get<SettingsStore>();
      final prefs = await SharedPreferences.getInstance();
      final result = prefs.getDouble(SharedPreferencesConst.FONT_SIZE_KEY);
      print('FontSize result: $result');
      if (result == null) {
        prefs.setDouble(SharedPreferencesConst.FONT_SIZE_KEY,
            SharedPreferencesConst.FONT_SIZE_VALUE);
      }
      settingsStore
          .setFontSize(prefs.getDouble(SharedPreferencesConst.FONT_SIZE_KEY)!);
      try {
        final list = await _fetchProjetos();
        addNewProjetos(list);
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<Project> projetoList = ObservableList<Project>();

  @action
  void addNewProjetos(List<Project> newProjetos) {
    projetoList.clear();
    projetoList.addAll(newProjetos);
  }

  @observable
  String? error;

  @action
  void setError(String? value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @computed
  bool get showProgress => loading && projetoList.isEmpty;

  Future<List<Project>> _fetchProjetos() async {
    final usecase = Modular.get<GetAllProjectByUserUsecase>();
    final auth = Modular.get<AuthStore>();

    if (auth.user != null) {
      final list = await usecase.getAllByUser(auth.user!.uid);
      addNewProjetos(list);
      return list;
    }
    return [];
  }

  Future<void> fetchAllDataForExportCsv(
      final String projetoId, final BuildContext context) async {
    setLoading(true);

    final CsvHelper csvHelper = CsvHelper();
    final FirebaseFirestore _firestore = Modular.get<FirebaseFirestore>();

    final List<List<dynamic>> rows = <List<dynamic>>[];
    await _createHeaderCsv(rows);

    final query = _firestore
        .collection(FirebaseFirestoreConstants.COLLECTION_ARVORES)
        .where('projetoId', isEqualTo: projetoId);

    final snapshotArvore = await query.get();
    final arvores =
        snapshotArvore.docs.map((e) => Arvore.fromMap(e.data(), e.id)).toList();

    late Project projeto;
    if (arvores.isNotEmpty) {
      for (final Arvore arvore in arvores) {
        print('Arvore: id: ${arvore.id} - $arvore');

        final queryProjeto = _firestore
            .collection(FirebaseFirestoreConstants.COLLECTION_PROJETOS)
            .doc(projetoId);
        final snapshotProjeto = await queryProjeto.get();

        final queryParcela = _firestore
            .collection(FirebaseFirestoreConstants.COLLECTION_PARCELAS)
            .doc(arvore.parcelaId);
        final snapshotParcela = await queryParcela.get();

        final queryMedicao = _firestore
            .collection(FirebaseFirestoreConstants.COLLECTION_MEDICOES)
            .doc(arvore.medicaoId);
        final snapshotMedicao = await queryMedicao.get();

        if (snapshotProjeto.exists &&
            snapshotParcela.exists &&
            snapshotMedicao.exists) {
          var parcela = Parcela.fromMap(snapshotParcela.data()!);
          parcela = parcela.copyWith(id: snapshotParcela.id);
          print('Parcela: ${parcela.identificadorParcela}');

          var medicao = Medicao.fromMap(snapshotMedicao.data()!);
          medicao = medicao.copyWith(id: snapshotMedicao.id);
          print('Medicao: ${medicao.nomeResponsavel}');

          projeto = Project.fromMap(snapshotProjeto.data()!);
          projeto = projeto.copyWith(id: snapshotProjeto.id);
          print('Projeto: ${projeto.nome}');

          await _createList(
            rows,
            projeto,
            parcela,
            medicao,
            arvore,
          );
        }
      }

      print('Listagem: $rows');
      await csvHelper.createFile(rows, context, projeto.nome);

      setLoading(false);
    } else {
      setLoading(false);
      error = 'Nenhuma árvore cadastrada para exportar.';
      Future.delayed(const Duration(seconds: 3))
          .whenComplete(() => error = null);
    }
  }

  Future<void> _createList(
      final List<List<dynamic>> rows,
      final Project projeto,
      final Parcela parcela,
      final Medicao medicao,
      final Arvore arvore) async {
    final List<dynamic> row = [];
    print('Entrou no createList');
    row.add(projeto.id ?? '');
    row.add(projeto.nome);
    row.add(projeto.area);
    row.add(projeto.visibilidadeProjetoEnum);
    row.add(projeto.dataCriacao.toString());
    row.add(projeto.ultimaAtualizacao.toString());
    row.add(parcela.id ?? '');
    row.add(parcela.projetoId ?? '');
    row.add(parcela.identificadorParcela.toString());
    row.add(parcela.areaParcela.toString());
    row.add(parcela.identificadorTalhao.toString());
    row.add(parcela.areaTalhao.toString());
    row.add(parcela.espacamento);
    row.add(parcela.latitude.toString());
    row.add(parcela.longitude.toString());
    row.add(parcela.dataPlantio.toString());
    row.add(parcela.dataCriacao.toString());
    row.add(parcela.ultimaAtualizacao.toString());
    row.add(medicao.id ?? '');
    row.add(medicao.parcelaId);
    row.add(medicao.nomeResponsavel);
    row.add(medicao.identificador);
    row.add(medicao.descricao);
    row.add(medicao.dataMedicao.toString());
    row.add(medicao.ultimaAtualizacao.toString());
    row.add(arvore.id ?? '');
    row.add(arvore.projetoId);
    row.add(arvore.parcelaId);
    row.add(arvore.medicaoId);
    row.add(arvore.numArvore.toString());
    row.add(arvore.dap.toString());
    row.add(arvore.alturaTotal.toString());
    row.add(arvore.estadoDescription);
    row.add(arvore.latitude);
    row.add(arvore.longitude);
    row.add(arvore.observacao);
    row.add(arvore.dataCriacao.toString());
    row.add(arvore.ultimaAtualizacao.toString());

    rows.add(row);
  }

  Future<void> _createHeaderCsv(final List<List<dynamic>> rows) async {
    rows.add(
      [
        "projetoId",
        "nome",
        "area",
        "visibilidade",
        "dataCriacao",
        "ultimaAtualizacao",
        "parcelaId",
        "projetoId",
        "identificadorParcela",
        "areaParcela",
        "identificadorTalhao",
        "areaTalhao",
        "espacamento",
        "latitude",
        "longitude",
        "dataPlantio",
        "dataCriacao",
        "ultimaAtualizacao",
        "medicaoId",
        "parcelaId",
        "responsavel",
        "identificador",
        "descricao",
        "dataMedicao",
        "ultimaAtualizacao",
        "arvoreId",
        "projetoId",
        "parcelaId",
        "medicaoId",
        "numArvore",
        "dap",
        "altura",
        "estado",
        "latitude",
        "longitude",
        "observacao",
        "dataCriacao",
        "ultimaAtualizacao"
      ],
    );
  }

  void refresh() => _fetchProjetos();

  @action
  Future<void> deleteProject(final dynamic projectId) async {
    final usecase = Modular.get<DeleteProjectUsecase>();
    loading = true;
    await usecase.delete(projectId);
    refresh();
    loading = false;
  }

  void goToParcelaPage(final Project project) {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.PARCELA_ROUTER}',
        arguments: project);
  }

  Future<void> goToCadastrarProjetoPage(final BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CadastrarProjetoPage(),
      ),
    );
    if (success != null && success) refresh();
  }

  void goToRegrasConsistenciaPage() {
    Modular.to
        .pushNamed('${RouterConst.PROJECT_ROUTER}${RouterConst.REGRAS_ROUTER}');
  }

  void goToAccountPage() {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.ACCOUNT_ROUTER}');
  }

  void goToSettingsPage() {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.SETTINGS_ROUTER_PAGE}');
  }

  void goToBluetoothModule() {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.BLUETOOTH_ROUTER}');
  }
}
