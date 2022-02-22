import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getAll();

  Future<ApiResponse> save(Project project);

  Future<Either<Failure, bool>> delete(String projectId);

  Future<Either<Failure, Project>> getById(num projectId);

  Future<List<Project>> getByName(String name);

  Future<Either<Failure, Project>> update(Project project);

  Future<Either<Failure, void>> enable(Project project);

  Future<Either<Failure, void>> disable(Project project);

  Future<List<Project>> getAllByUser(String uuid);

  Future<List<Project>> getByNameAndUser(String name, String uuid);
}
