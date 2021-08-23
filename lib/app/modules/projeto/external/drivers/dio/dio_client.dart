import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/drivers/dio/custom_interceptors.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://forestinv-api.herokuapp.com/api/v1',
      connectTimeout: 10000,
      receiveTimeout: 5000,
    ),
  )..interceptors.add(CustomInterceptors());

  Dio get instance => _dio;
}
