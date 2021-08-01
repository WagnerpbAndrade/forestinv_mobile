import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/errors/error.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/datasource/projeto_datasource.dart';

class HerokuDatasourceImpl implements ProjetoDatasource {
  final dio = Modular.get<Dio>();

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
    try {
      var response =
          await dio.get('http://forestinv-api.herokuapp.com/api/v1/projects');

      var projectObjsJson = jsonDecode(response.data) as List;
      List<Project> projectObjs = projectObjsJson
          .map((projectJson) => Project.fromJson(projectJson))
          .toList();
      return projectObjs;
    } on DatasourceError catch (e) {
      throw e;
    }
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
