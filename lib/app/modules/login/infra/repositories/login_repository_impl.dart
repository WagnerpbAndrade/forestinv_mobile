import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/repositories/login_repository.dart';
import 'package:forestinv_mobile/app/modules/login/infra/data_source/login_firebase_data_source.dart';

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
}
