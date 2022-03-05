import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/delete_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/pages/cadastrar_projeto_page.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {
    autorun((_) async {
      setLoading(true);

      try {
        _fetchProjetos();
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

  Future<void> _fetchProjetos() async {
    final usecase = Modular.get<GetAllProjectByUserUsecase>();
    final auth = Modular.get<AuthStore>();

    if (auth.user != null) {
      final list = await usecase.getAllByUser(auth.user!.uid);

      addNewProjetos(list);
    }
  }

  Future<void> fetchAllPorraToda(final String projetoId) async {
    final List<List<String>> listToCsv = [];
    final instance = FirebaseFirestore.instance;
    final projeto = await instance
        .collection(FirebaseFirestoreConstants.COLLECTION_PROJETOS)
        .doc(projetoId)
        .get();

    print('Projeto: ${projeto.data()}');
    //listToCsv.add(projeto.data());
    final queryParcela = await instance
        .collection(FirebaseFirestoreConstants.COLLECTION_PARCELAS)
        .where('projetoId', isEqualTo: projeto.id)
        .get();
    queryParcela.docs.forEach((parcela) async {
      print('Parcela: ${parcela.data()}');

      final queryMedicao = await instance
          .collection(FirebaseFirestoreConstants.COLLECTION_MEDICOES)
          .where('parcelaId', isEqualTo: parcela.id)
          .get();
      queryMedicao.docs.forEach((medicao) async {
        print('Medicao: ${medicao.data()}');

        final queryArvore = await instance
            .collection(FirebaseFirestoreConstants.COLLECTION_ARVORES)
            .where('medicaoId', isEqualTo: medicao.id)
            .get();
        queryArvore.docs.forEach((arvore) {
          print('Arvore: ${arvore.data()}');
        });
      });
    });
  }

  void refresh() => _fetchProjetos();

  @action
  Future<void> deleteProject(final dynamic projectId) async {
    final usecase = Modular.get<DeleteProjectUsecase>();
    loading = true;
    await usecase.delete(projectId);
    refresh();
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
}
