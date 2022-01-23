import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProjectRepository {
  Future<List<Project>> getAll();

  Future<void> add(Project project);

  Future<Either<Failure, bool>> delete(num projectId);

  Future<Either<Failure, Project>> getById(num projectId);

  Future<List<Project>> getByName(String name);

  Future<Either<Failure, void>> update(Project project);

  Future<Either<Failure, void>> enable(Project project);

  Future<Either<Failure, void>> disable(Project project);
}
