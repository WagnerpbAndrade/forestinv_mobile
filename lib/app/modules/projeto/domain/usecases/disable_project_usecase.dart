import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:fpdart/fpdart.dart';

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
