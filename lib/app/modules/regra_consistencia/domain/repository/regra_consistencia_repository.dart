import 'package:forestinv_mobile/app/core/interface/api_response.dart';

abstract class RegraConsistenciaRepository {
  Future<ApiResponse> getAllByUser(final String uuid);
}
