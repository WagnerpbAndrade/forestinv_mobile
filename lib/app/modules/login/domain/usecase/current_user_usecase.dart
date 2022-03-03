import 'package:forestinv_mobile/app/modules/login/domain/repositories/login_repository.dart';
import 'package:forestinv_mobile/app/modules/login/infra/models/user_model.dart';

abstract class CurrentUserUsecase {
  Future<UserModelFirebase?> currentUser();
}

class CurrentUserUsecaseImpl implements CurrentUserUsecase {
  final LoginRepository _repository;

  CurrentUserUsecaseImpl(this._repository);

  @override
  Future<UserModelFirebase?> currentUser() async {
    return _repository.currentUser();
  }
}
