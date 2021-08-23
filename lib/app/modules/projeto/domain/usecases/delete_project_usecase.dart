import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:fpdart/fpdart.dart';

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
