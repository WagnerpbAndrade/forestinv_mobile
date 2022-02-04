import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/repositories/login_repository.dart';

abstract class RecoveryPasswordUsecase {
  Future<ApiResponse> recoveryPassword(final String email);
}

class RecoveryPasswordUsecaseImpl implements RecoveryPasswordUsecase {
  final LoginRepository repository;

  RecoveryPasswordUsecaseImpl(this.repository);

  @override
  Future<ApiResponse> recoveryPassword(String email) {
    return repository.recoverPassword(email);
  }
}
