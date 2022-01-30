import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/delete_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_id_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_name_project_usecase.dart';
import 'package:mobx/mobx.dart';

class ProjetoController {
  @observable
  String errorMessage = '';

  @action
  void setErrorMessage(String value) => errorMessage = value;

  @observable
  bool error = false;

  @action
  void setError(bool value) => error = value;

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

  void deleteProject(String projectId) async {
    final usecase = Modular.get<DeleteProjectUsecase>();
    setError(false);

    final result = await usecase.delete(projectId);
    result.fold(
      (failure) {
        setError(true);
        setErrorMessage(failure.errorMessage);
      },
      (right) {
        setError(false);
        setErrorMessage('Projeto deletado com sucesso');
      },
    );
  }

  void goToParcelaPage(Project project) {
    Modular.to.pushNamed('/parcela', arguments: project);
  }

  void goToNewProject() {
    Modular.to.pushNamed(RouterConst.ADD_PROJECT_ROUTER);
  }
}
