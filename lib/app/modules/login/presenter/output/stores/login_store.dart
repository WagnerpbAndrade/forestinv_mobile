import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_with_email_password_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/infra/models/user_model.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/stores/regra_consistencia_store.dart';
import 'package:forestinv_mobile/helper/extensions.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();
  String? get emailError =>
      email == null || emailValid ? null : 'E-mail inválido';

  @observable
  String? password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 6;
  String? get passwordError =>
      password == null || passwordValid ? null : 'Senha inválida';

  @computed
  Function? get loginOnPressed =>
      emailValid && passwordValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  bool loadingGoogle = false;

  @computed
  Function? get googleOnPressed => !loading ? _google : null;

  @action
  Future<void> _login() async {
    loading = true;

    final usecase = Modular.get<LoginWithEmailPasswordUsecase>();

    final apiResponse =
        await usecase.loginWithEmailAndPassword(email!, password!);
    if (apiResponse.ok) {
      final UserModelFirebase user = apiResponse.result;
      final auth = Modular.get<AuthStore>();
      auth.setUser(user);
      Modular.to.popAndPushNamed(RouterConst.PROJECT_ROUTER);
      //Modular.to.popAndPushNamed(RouterConst.INTRO_ROUTER);
    } else {
      error = apiResponse.message;
    }

    loading = false;
  }

  Future<void> _google() async {
    final usecase = Modular.get<LoginGoogleUsecase>();
    final authStore = Modular.get<AuthStore>();
    final regraStore = Modular.get<RegraConsistenciaStore>();
    final apiResponse = await usecase.loginGoogleSignIn();
    if (apiResponse.ok) {
      print(apiResponse.result);
      authStore.setUser(apiResponse.result);
      final UserModelFirebase user = apiResponse.result;
      await regraStore.salveAllRegrasByUser(user.uid);
      Modular.to.popAndPushNamed(RouterConst.PROJECT_ROUTER);
    } else {
      error = apiResponse.message;
    }
  }

  void goToRecoveryPasswordPage() {
    Modular.to.pushNamed(RouterConst.RECOVERY_PASSWORD_ROUTER);
  }

  void goToSignUpPage() {
    Modular.to.pushNamed(RouterConst.SIGN_UP_ROUTER);
  }

  void goToHome() {
    Modular.to.pushReplacementNamed(RouterConst.PROJECT_ROUTER);
  }
}
