import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class DeleteUsecase {
  Future<Either<Failure, void>> delete(num projectId);
}

class DeleteProjectUsecaseImpl implements DeleteUsecase {
  final ProjectRepository repository;

  DeleteProjectUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> delete(num projectId) async {
    return repository.delete(projectId);
  }
}
