import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';

abstract class ProjetoRepository {
  Future<Either<Failure, List<Project>>> getAll();

  Future<Either<Failure, void>> add(Project project);

  Future<Either<Failure, bool>> delete(num projectId);

  Future<Either<Failure, Project>> getById(num projectId);

  Future<Either<Failure, void>> update(Project project);

  Future<Either<Failure, void>> enable(Project project);

  Future<Either<Failure, void>> disable(Project project);
}
