import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/project_usecase.dart';
import 'package:fpdart/fpdart.dart';

class GetAllProjectsUsecaseImpl extends ProjectUsecase {
  final ProjectRepository _repository;

  GetAllProjectsUsecaseImpl(this._repository);
  @override
  Future<Either<Failure, List<Project>>> getAll() async {
    return _repository.getAll();
  }
}
