import 'package:forestinv_mobile/app/core/interface/api_response.dart';

abstract class LoginFirebaseDatasource {
  Future<ApiResponse> loginGoogleSignIn();
  Future<void> logout();
}
