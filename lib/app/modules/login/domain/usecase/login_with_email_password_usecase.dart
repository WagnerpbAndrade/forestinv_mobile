import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/repositories/login_repository.dart';

abstract class LoginWithEmailPasswordUsecase {
  Future<ApiResponse> loginWithEmailAndPassword(
      final String email, final String password);
}

class LoginWithEmailPasswordUsecaseImpl
    implements LoginWithEmailPasswordUsecase {
  final LoginRepository repository;

  LoginWithEmailPasswordUsecaseImpl(this.repository);

  @override
  Future<ApiResponse> loginWithEmailAndPassword(
      final String email, final String password) {
    return repository.loginWithEmailAndPassword(email, password);
  }
}
