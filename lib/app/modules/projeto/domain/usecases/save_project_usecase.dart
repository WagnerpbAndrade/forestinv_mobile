import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class SaveProjectUsecase {
  Future<Either<Failure, Project>> save(Project project);
}

class SaveProjectUsecaseImpl implements SaveProjectUsecase {
  final ProjectRepository repository;

  SaveProjectUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, Project>> save(Project project) {
    return repository.save(project);
  }
}
