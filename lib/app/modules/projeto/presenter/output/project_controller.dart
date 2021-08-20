import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';

class ProjectController extends ProjetoStore {
  Future<List<Project>?> getAllProject() async {
    final usecase = Modular.get<ProjectUsecase>();
    try {
      final result = await usecase.getAll();
      if (result.isRight()) {
        return result.getOrElse((_) => <Project>[]);
      }
    } catch (e) {
      throw e;
    }
  }
}
