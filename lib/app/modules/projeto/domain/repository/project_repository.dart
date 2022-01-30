import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getAll();

  Future<Either<Failure, Project>> save(Project project);

  Future<Either<Failure, bool>> delete(String projectId);

  Future<Either<Failure, Project>> getById(num projectId);

  Future<List<Project>> getByName(String name);

  Future<Either<Failure, Project>> update(Project project);

  Future<Either<Failure, void>> enable(Project project);

  Future<Either<Failure, void>> disable(Project project);
}
