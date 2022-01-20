import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_id_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_name_project_usecase.dart';
import 'package:mobx/mobx.dart';

part 'projeto_store.g.dart';

class ProjetoStore = _ProjetoStoreBase with _$ProjetoStore;

abstract class _ProjetoStoreBase with Store {
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

  void goToProjectPage(Project project) {
    Modular.to.pushNamed('/projeto', arguments: project);
  }
}
