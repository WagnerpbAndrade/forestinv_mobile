import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class UpdateUsecase {
  Future<Either<Failure, void>> update(Project project);
}

class UpdateProjectUsecaseImpl implements UpdateUsecase {
  final ProjectRepository repository;

  UpdateProjectUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> update(Project project) async {
    return repository.update(project);
  }
}
