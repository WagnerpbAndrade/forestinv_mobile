import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class EnableUsecase {
  Future<Either<Failure, void>> enable(Project project);
}

class EnableProjectUsecaseImpl implements EnableUsecase {
  final ProjectRepository repository;

  EnableProjectUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> enable(Project project) async {
    return repository.enable(project);
  }
}
