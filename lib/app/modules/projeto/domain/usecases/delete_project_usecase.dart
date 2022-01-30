import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class DeleteProjectUsecase {
  Future<Either<Failure, bool>> delete(String projectId);
}

class DeleteProjectUsecaseImpl implements DeleteProjectUsecase {
  final ProjectRepository repository;

  DeleteProjectUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> delete(String projectId) {
    return repository.delete(projectId);
  }
}
