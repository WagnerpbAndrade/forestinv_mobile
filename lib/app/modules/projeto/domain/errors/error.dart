import 'package:forestinv_mobile/app/core/interface/failure.dart';

class DatasourceError extends Failure {
  final String? message;

  DatasourceError({this.message});
}
