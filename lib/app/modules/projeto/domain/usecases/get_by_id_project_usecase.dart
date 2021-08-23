import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class GetByIdProjectUsecase {
  Future<Either<Failure, Project>> getById(num projectId);
}

class GetByIdProjectUsecaseImpl implements GetByIdProjectUsecase {
  final ProjectRepository repository;

  GetByIdProjectUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, Project>> getById(num projectId) async {
    return repository.getById(projectId);
  }
}
