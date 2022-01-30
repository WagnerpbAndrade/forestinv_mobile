import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/errors/error.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/errors/project_failures.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/datasource/projeto_datasource.dart';

class ProjectDatasourceImpl implements ProjetoDatasource {
  static const String _baseUrl =
      'https://forestinv-api.herokuapp.com/v1/api/projetos';

  final DioClient dioClient;

  ProjectDatasourceImpl(this.dioClient);

  @override
  Future<Project> save(Project project) async {
    try {
      final Response response =
          await dioClient.post(_baseUrl, '', project.toMap());

      print('Projeto Info: ${response.data}');
      return Project.fromMap(response.data);
    } on DioError catch (e, stacktrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw SaveProjectNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        throw SaveProjectNoInternetConnection();
      } else {
        throw SaveProjectError(
            stacktrace, 'ProjectDatasourceImpl-save', e, e.message);
      }
    }
  }

  @override
  Future<bool> delete(num projectId) async {
    try {
      await dioClient.delete(_baseUrl, '/$projectId');

      return true;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }

      throw DatasourceError();
    }
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
      final Response response = await dioClient.get(_baseUrl, '');

      print('Projeto Info: ${response.data}');

      return (response.data as List).map((e) => Project.fromMap(e)).toList();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }

      throw DatasourceError();
    }
  }

  @override
  Future<Project> getById(num projectId) async {
    try {
      final Response response = await dioClient.get(_baseUrl, '/$projectId');

      print('Projeto Info: ${response.data}');

      return Project.fromMap(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }

      throw DatasourceError();
    }
  }

  @override
  Future<void> update(Project project) async {
    try {
      final Response response =
          await dioClient.put(_baseUrl, '', project.toMap());

      print('Projeto Info: ${response.data}');
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }

      throw DatasourceError();
    }
  }

  @override
  Future<List<Project>> getByName(String name) async {
    try {
      final Response response =
          await dioClient.get(_baseUrl + '/name?value=', '$name');

      print('Projeto Info: ${response.data}');

      return (response.data as List).map((e) => Project.fromMap(e)).toList();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }

      throw DatasourceError();
    }
  }
}
