import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/entities/sign_up_entity.dart';
import 'package:forestinv_mobile/app/modules/login/infra/models/user_model.dart';

abstract class LoginFirebaseDatasource {
  Future<ApiResponse> loginGoogleSignIn();

  Future<ApiResponse> loginWithEmailAndPassword(String email, String password);

  Future<void> logout();

  Future<ApiResponse> recoverPassword(final String email);

  Future<ApiResponse> createUser(final SignUpEntity signUp);

  Future<UserModelFirebase?> currentUser();
}
