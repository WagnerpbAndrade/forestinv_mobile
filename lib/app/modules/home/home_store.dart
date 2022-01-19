import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ProjetoStore projetoStore;

  HomeStoreBase(this.projetoStore) {
    autorun((_) async {
      try {
        setLoading(true);
        final projetosFiltrados = await projetoStore.getProjectsByName(search);
        projectsList.clear();
        projectsList.addAll(projetosFiltrados);
        setError('');
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<Project> projectsList = ObservableList<Project>();

  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @observable
  String error = '';

  @action
  void setError(String value) => error = value;

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  Future<List<Project>> getListProject() async {
    final projetos = await projetoStore.getAllProject();
    return projetos;
  }
}
