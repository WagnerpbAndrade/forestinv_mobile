import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class AddProjectUsecase {
  Future<Either<Failure, void>> save(Project project);
}

class AddProjectUsecaseImpl implements AddProjectUsecase {
  final ProjectRepository repository;

  AddProjectUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> save(Project project) async {
    return await repository.save(project);
  }
}
