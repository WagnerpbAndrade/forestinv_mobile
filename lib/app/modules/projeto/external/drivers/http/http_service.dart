import 'dart:io';

import 'package:http/http.dart';

class HttpService {
  final Client _http;

  static final Url = "https://forestinv-api.herokuapp.com/api/v1";
  static final headers = {'Content-Type': 'application/json'};

  HttpService(this._http);

  Future getRequest(String endPoint) async {
    final url = '${HttpService.Url}/$endPoint';

    print("GET > $url");

    try {
      return await _http.get(Uri.parse(url));
    } on HttpException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }
}
