import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_id_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';

class ProjectController extends ProjetoStore {
  Future<List<Project>?> getAllProject() async {
    final usecase = Modular.get<GetAllProjectsUsecase>();
    try {
      final result = await usecase.getAll();
      if (result.isRight()) {
        return result.getOrElse((_) => <Project>[]);
      }
    } catch (e) {
      throw e;
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
      throw e;
    }
  }
}
