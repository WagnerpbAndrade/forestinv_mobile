import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/errors/error.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/datasource/projeto_datasource.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjetoDatasource datasource;

  ProjectRepositoryImpl(this.datasource);

  @override
  Future<ApiResponse> save(Project project) async {
    return datasource.save(project);
  }

  @override
  Future<Either<Failure, bool>> delete(String projectId) async {
    try {
      return Right(await datasource.delete(projectId));
    } on Failure catch (e) {
      return Left(e);
    }
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
  Future<List<Project>> getAll() async {
    try {
      final result = await datasource.getAll();

      return result;
    } on DatasourceError catch (e) {
      throw Left(e);
    } catch (e) {
      throw Left(DatasourceError());
    }
  }

  @override
  Future<ApiResponse> getById(final String projectId) async {
    return datasource.getById(projectId);
  }

  @override
  Future<ApiResponse> update(Project project) async {
    return datasource.update(project);
  }

  @override
  Future<List<Project>> getByName(String name) async {
    try {
      return await datasource.getByName(name);
    } on DatasourceError catch (e) {
      throw Left(e);
    } catch (e) {
      throw Left(DatasourceError());
    }
  }

  @override
  Future<List<Project>> getAllByUser(String uuid) async {
    try {
      return await datasource.getAllByUser(uuid);
    } on DatasourceError catch (e) {
      throw Left(e);
    } catch (e) {
      throw Left(DatasourceError());
    }
  }

  @override
  Future<List<Project>> getByNameAndUser(String name, String uuid) async {
    try {
      return await datasource.getByNameAndUser(name, uuid);
    } on DatasourceError catch (e) {
      throw Left(e);
    } catch (e) {
      throw Left(DatasourceError());
    }
  }
}
