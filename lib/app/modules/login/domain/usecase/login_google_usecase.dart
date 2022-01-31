import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/repositories/login_repository.dart';

abstract class LoginGoogleUsecase {
  Future<ApiResponse> loginGoogleSignIn();
}

class LoginGoogleUsecaseImpl implements LoginGoogleUsecase {
  final LoginRepository repository;

  LoginGoogleUsecaseImpl(this.repository);

  @override
  Future<ApiResponse> loginGoogleSignIn() {
    return repository.loginGoogleSignIn();
  }
}
