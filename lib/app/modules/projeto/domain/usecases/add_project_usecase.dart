import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class AddProjectUsecase {
  Future<void> add(Project project);
}

class addProjectUsecaseImpl implements AddProjectUsecase {
  final ProjectRepository repository;

  addProjectUsecaseImpl(this.repository);

  @override
  Future<void> add(Project project) {
    return repository.add(project);
  }
}
