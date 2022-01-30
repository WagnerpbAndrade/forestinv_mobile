import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class UpdateProjectUsecase {
  Future<Either<Failure, Project>> update(Project project);
}

class UpdateProjectUsecaseImpl implements UpdateProjectUsecase {
  final ProjectRepository repository;

  UpdateProjectUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, Project>> update(Project project) async {
    return await repository.update(project);
  }
}
