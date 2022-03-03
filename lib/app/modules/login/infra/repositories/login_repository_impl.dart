import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/entities/sign_up_entity.dart';
import 'package:forestinv_mobile/app/modules/login/domain/repositories/login_repository.dart';
import 'package:forestinv_mobile/app/modules/login/infra/data_source/login_firebase_data_source.dart';
import 'package:forestinv_mobile/app/modules/login/infra/models/user_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginFirebaseDatasource datasource;

  LoginRepositoryImpl(this.datasource);

  @override
  Future<ApiResponse> loginGoogleSignIn() {
    return datasource.loginGoogleSignIn();
  }

  @override
  Future<void> logout() {
    return datasource.logout();
  }

  @override
  Future<ApiResponse> loginWithEmailAndPassword(String email, String password) {
    return datasource.loginWithEmailAndPassword(email, password);
  }

  @override
  Future<ApiResponse> recoverPassword(String email) {
    return datasource.recoverPassword(email);
  }

  @override
  Future<ApiResponse> createUser(final SignUpEntity signUp) {
    return datasource.createUser(signUp);
  }

  @override
  Future<UserModelFirebase?> currentUser() async {
    return datasource.currentUser();
  }
}
