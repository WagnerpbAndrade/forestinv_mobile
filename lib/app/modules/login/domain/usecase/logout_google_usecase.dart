import 'package:forestinv_mobile/app/modules/login/domain/repositories/login_repository.dart';

abstract class LogoutGoogleUsecase {
  Future<void> logout();
}

class LogoutGoogleUsecaseImpl implements LogoutGoogleUsecase {
  final LoginRepository repository;

  LogoutGoogleUsecaseImpl(this.repository);

  @override
  Future<void> logout() {
    return repository.logout();
  }
}
