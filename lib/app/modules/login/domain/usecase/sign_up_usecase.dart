import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/entities/sign_up_entity.dart';
import 'package:forestinv_mobile/app/modules/login/domain/repositories/login_repository.dart';

abstract class SignUpUsecase {
  Future<ApiResponse> createUser(final SignUpEntity signUp);
}

class SignUpUsecaseImpl implements SignUpUsecase {
  final LoginRepository repository;

  SignUpUsecaseImpl(this.repository);

  @override
  Future<ApiResponse> createUser(final SignUpEntity signUp) {
    return repository.createUser(signUp);
  }
}
