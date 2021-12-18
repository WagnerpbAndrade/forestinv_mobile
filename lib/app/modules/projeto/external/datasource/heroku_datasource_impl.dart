import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/errors/error.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/drivers/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/datasource/projeto_datasource.dart';
import 'package:forestinv_mobile/controller/base_controller.dart';

class HerokuDatasourceImpl with BaseController implements ProjetoDatasource {
  static final String _baseUrl = 'https://forestinv-api.herokuapp.com/api/v1';
  HerokuDatasourceImpl();

  @override
  Future<void> addProject(Project project) async {
    try {
      Response response = await DioClient()
          .post(_baseUrl, '/projetos', project.toMap())
          .catchError(handleError);

      print('User Info: ${response.data}');
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
      Response response = await DioClient().get(_baseUrl, '/projetos');

      print('User Info: ${response.data}');

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
    /*try {
      Response response = await _dioClient.instance.get('/projetos/$projectId');

      print('User Info: ${response.data}');

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
    }*/
    throw Exception();
  }

  @override
  Future<void> update(Project project) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
