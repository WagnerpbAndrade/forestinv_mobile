import 'dart:html';

import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/drivers/dio/custom_interceptors.dart';

class DioService {
  final Dio _dio;

  static final Url = "https://forestinv-api.herokuapp.com/api/v1/";
  static final headers = {'Content-Type': 'application/json'};

  DioService(this._dio) {
    _dio.options.headers = DioService.headers;
    _dio.options.baseUrl = DioService.Url;

    initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(CustomInterceptors());
  }
}
