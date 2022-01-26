import 'package:dartz/dartz.dart';
import 'package:forestinv_mobile/app/core/constants/error_message.dart';
import 'package:forestinv_mobile/app/core/exceptions/app_exceptions.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/errors/error.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/datasource/projeto_datasource.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjetoDatasource datasource;

  ProjectRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, void>> save(Project project) async {
    try {
      return Right(await datasource.save(project));
    } on ApiNotRespondingException {
      return Left(ApiNotRespondingFailure(
        title: ErrorMessage.TITLE,
        message: ErrorMessage.message_api_failure,
      ));
    } catch (e) {
      return Left(ApiNotRespondingFailure(
        title: ErrorMessage.TITLE,
        message: ErrorMessage.message_api_failure,
      ));
    }
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
  Future<Either<Failure, Project>> getById(num projectId) async {
    try {
      final result = await datasource.getById(projectId);

      return Right(result);
    } on DatasourceError catch (e) {
      throw Left(e);
    } catch (e) {
      throw Left(DatasourceError());
    }
  }

  @override
  Future<Either<Failure, void>> update(Project project) {
    // TODO: implement update
    throw UnimplementedError();
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
}
