import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/drivers/dio/logging.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://forestinv-api.herokuapp.com/api/v1',
      connectTimeout: 10000,
      receiveTimeout: 5000,
    ),
  )..interceptors.add(Logging());

  Future<List<Project>?> getAll() async {
    try {
      Response response = await _dio.get('/projetos');

      print('User Info: ${response.data}');

      return (response.data as List).map((p) => Project.fromMap(p)).toList();
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
    }
  }
}
