import 'package:forestinv_mobile/app/core/interface/api_response.dart';

abstract class AccountRepository {
  Future<ApiResponse> updateProfileName(final String profileName);

  Future<ApiResponse> updatePassword(final String password);
}
