import 'package:forestinv_mobile/app/core/interface/api_response.dart';

abstract class LoginRepository {
  Future<ApiResponse> loginGoogleSignIn();

  Future<void> logout();
}
