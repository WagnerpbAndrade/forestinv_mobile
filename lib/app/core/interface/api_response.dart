class ApiResponse<T> {
  late bool ok;
  String? message;
  T? result;

  ApiResponse.ok({this.result, this.message}) {
    ok = true;
  }

  ApiResponse.error({this.result, this.message}) {
    ok = false;
  }
}
