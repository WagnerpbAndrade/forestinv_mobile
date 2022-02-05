import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/repositories/login_repository.dart';

abstract class SignUpUsecase {
  Future<ApiResponse> createUser(final String email, final String password);
}

class SignUpUsecaseImpl implements SignUpUsecase {
  final LoginRepository repository;

  SignUpUsecaseImpl(this.repository);

  @override
  Future<ApiResponse> createUser(String email, String password) {
    return repository.createUser(email, password);
  }
}
