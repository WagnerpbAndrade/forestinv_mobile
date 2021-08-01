import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/core/interface/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/errors/error.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/datasource/projeto_datasource.dart';
import 'package:fpdart/fpdart.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final datasource = Modular.get<ProjetoDatasource>();

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
  Future<Either<Failure, List<Project>>> getAll() async {
    try {
      final result = await datasource.getAll();

      return Right(result);
    } on DatasourceError catch (e) {
      throw Left(e);
    } catch (e) {
      throw Left(DatasourceError());
    }
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
