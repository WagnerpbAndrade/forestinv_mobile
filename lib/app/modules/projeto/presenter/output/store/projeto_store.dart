import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_id_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_name_project_usecase.dart';
import 'package:mobx/mobx.dart';

part 'projeto_store.g.dart';

class ProjetoStore = _ProjetoStoreBase with _$ProjetoStore;

abstract class _ProjetoStoreBase with Store {
  _ProjetoStoreBase() {
    autorun((_) async {
      try {
        setLoading(true);
        List<Project> projetos;
        if (search.isEmpty) {
          projetos = await getAllProject();
        } else {
          projetos = await getProjectsByName(search);
        }
        projectsList.clear();
        projectsList.addAll(projetos);
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

  Future<List<Project>> getAllProject() async {
    final usecase = Modular.get<GetAllProjectsUsecase>();
    try {
      return await usecase.getAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Project>> getProjectsByName(String name) async {
    final usecase = Modular.get<GetByNameProjectUsecase>();
    try {
      return await usecase.getByName(name);
    } catch (e) {
      rethrow;
    }
  }

  Future<Project?> getById(num projectId) async {
    final usecase = Modular.get<GetByIdProjectUsecase>();
    try {
      final result = await usecase.getById(projectId);
      if (result.isRight()) {
        return result.fold(
            (l) => throw Exception("Projeto não encontrato"), (r) => r);
      }
    } catch (e) {
      rethrow;
    }
  }

  void goToParcelaPage(Project project) {
    Modular.to.pushNamed('/parcela', arguments: project);
  }
}
