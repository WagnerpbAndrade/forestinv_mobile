import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/core/exceptions/app_exceptions.dart';

class DioClient {
  static const int TIME_OUT_DURATION = 60;
  //GET
  Future<Response> get(String baseUrl, String api) async {
    final uri = Uri.parse(baseUrl + api);
    try {
      final response = await Dio()
          .get(baseUrl + api)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responded in time', url: uri.toString());
    }
  }

  //POST
  Future<Response> post(String baseUrl, String api, dynamic payloadObj) async {
    final uri = Uri.parse(baseUrl + api);
    final payload = json.encode(payloadObj);
    try {
      final response = await Dio()
          .post(baseUrl + api, data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responded in time', url: uri.toString());
    }
  }

  //PUT
  Future<Response> put(String baseUrl, String api, dynamic payloadObj) async {
    final uri = Uri.parse(baseUrl + api);
    final payload = json.encode(payloadObj);
    try {
      final response = await Dio()
          .put(baseUrl + api, data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responded in time', url: uri.toString());
    }
  }

  //DELETE
  //PUT
  Future<void> delete(String baseUrl, String api) async {
    final uri = Uri.parse(baseUrl + api);
    try {
      await Dio()
          .delete(baseUrl + api)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responded in time', url: uri.toString());
    }
  }

  //OTHER

  dynamic _processResponse(response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 204:
      case 400:
        throw BadRequestException(
            message: utf8.decode(response.bodyBytes),
            url: response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            message: utf8.decode(response.bodyBytes),
            url: response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            message: 'Error occured with code : ${response.statusCode}',
            url: response.request!.url.toString());
    }
  }
}
