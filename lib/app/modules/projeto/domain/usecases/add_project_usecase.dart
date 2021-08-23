import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class AddProjectUsecase {
  Future<Either<Failure, void>> add(Project project);
}

class addProjectUsecaseImpl implements AddProjectUsecase {
  final ProjectRepository repository;

  addProjectUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> add(Project project) {
    return repository.add(project);
  }
}
