import 'package:forestinv_mobile/app/core/interface/api_response.dart';

abstract class LoginFirebaseDatasource {
  Future<ApiResponse> loginGoogleSignIn();

  Future<ApiResponse> loginWithEmailAndPassword(String email, String password);

  Future<void> logout();

  Future<ApiResponse> recoverPassword(final String email);

  Future<ApiResponse> createUser(final String email, final String password);
}
