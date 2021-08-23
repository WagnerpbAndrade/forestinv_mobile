import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class GetAllProjectsUsecase {
  Future<Either<Failure, List<Project>>> getAll();
}

class GetAllProjectsUsecaseImpl extends GetAllProjectsUsecase {
  final ProjectRepository _repository;

  GetAllProjectsUsecaseImpl(this._repository);
  @override
  Future<Either<Failure, List<Project>>> getAll() async {
    return _repository.getAll();
  }
}
