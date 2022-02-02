import 'package:forestinv_mobile/app/core/interface/api_response.dart';

abstract class LoginFirebaseDatasource {
  Future<ApiResponse> loginGoogleSignIn();

  Future<ApiResponse> loginWithEmailAndPassword(String email, String password);

  Future<void> logout();
}
