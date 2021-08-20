import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String? msg;
  final int? statusCode;

  ApiException({required this.statusCode, this.msg});

  ApiException.fromResponse(Response response)
      : this.statusCode = response.statusCode,
        this.msg = response.data;
}

class ApiMessageException implements Exception {
  final String msg;
  final int statusCode;

  ApiMessageException({required this.statusCode, required this.msg});
}
