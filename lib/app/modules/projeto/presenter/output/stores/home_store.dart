import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_by_user_usecase.dart';
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

    final list = await usecase.getAllByUser(auth.getUser().uid);

    addNewProjetos(list);
  }
}
