import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class DisableUsecase {
  Future<Either<Failure, void>> disable(Project project);
}

class EnableProjectUsecaseImpl implements DisableUsecase {
  final ProjectRepository repository;

  EnableProjectUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> disable(Project project) async {
    return repository.disable(project);
  }
}
