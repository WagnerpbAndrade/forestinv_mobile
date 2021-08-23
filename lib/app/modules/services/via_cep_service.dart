import 'package:dio/dio.dart';

import 'models/result_cep.dart';

class ViaCepService {
  final Dio _dio;

  ViaCepService(this._dio) {
    _dio.options.baseUrl = 'https://viacep.com.br/ws/';
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 5000;
  }

  Future<ResultCep> fetchCep({required String cep}) async {
    String path = '/$cep/json';
    final Response response = await _dio.get(path);
    if (response.statusCode == 200) {
      print(response.data);
      return ResultCep.fromMap(response.data);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
