import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/core/data/exceptions/server_exception.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/drivers/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/datasource/projeto_datasource.dart';
import 'package:http/http.dart' as http;

class HerokuDatasourceImpl implements ProjetoDatasource {
  //final Dio _dio;

  //static final URL = "https://forestinv-api.herokuapp.com/api/v1/projetos";
  //static final headers = {'Content-Type': 'application/json'};

  HerokuDatasourceImpl();

  @override
  Future<void> addProject(Project project) {
    // TODO: implement addProject
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(num projectId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> disable(Project project) {
    // TODO: implement disable
    throw UnimplementedError();
  }

  @override
  Future<void> enable(Project project) {
    // TODO: implement enable
    throw UnimplementedError();
  }

  @override
  Future<List<Project>> getAll() async {
    DioClient dioClient = DioClient();

    var list = await dioClient.getAll();

    return list!;
  }

  @override
  Future<Project> getById(num projectId) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> update(Project project) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
