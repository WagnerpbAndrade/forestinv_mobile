import 'package:forestinv_mobile/app/core/interface/api_response.dart';

abstract class RegraConsistenciaDatasource {
  Future<ApiResponse> getAllByUser(final String uuid);
}
