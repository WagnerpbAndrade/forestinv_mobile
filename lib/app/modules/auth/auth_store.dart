import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/current_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/logout_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/infra/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  _AuthStoreBase() {
    _getCurrentUser();
  }

  @observable
  UserModelFirebase? user;

  @action
  void setUser(UserModelFirebase? value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> logoutGoogle() async {
    final usecase = Modular.get<LogoutGoogleUsecase>();
    await usecase.logout();
    setUser(null);
    Modular.to.popAndPushNamed(RouterConst.INITIAL_ROUTER);
    print('Usuário deslogado');
  }

  Future<void> _getCurrentUser() async {
    final usecase = Modular.get<CurrentUserUsecase>();
    final user = await usecase.currentUser();
    setUser(user);
  }
}
