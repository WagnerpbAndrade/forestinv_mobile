import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/projeto_repository.dart';

class ProjetoRepositoryImpl implements ProjetoRepository {
  @override
  Future<Either<Failure, void>> add(Project project) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> delete(num projectId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> disable(Project project) {
    // TODO: implement disable
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> enable(Project project) {
    // TODO: implement enable
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Project>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Project>> getById(num projectId) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> update(Project project) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
