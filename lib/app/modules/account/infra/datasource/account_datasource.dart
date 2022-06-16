import 'package:forestinv_mobile/app/core/interface/api_response.dart';

abstract class AccountDatasource {
  Future<ApiResponse> updatePassword(final String password);

  Future<ApiResponse> updateProfileName(final String profileName);
}
