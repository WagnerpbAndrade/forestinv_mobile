import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/logout_google_usecase.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void siginWithEmailAndPassword() {}

  Future<void> loginWithGoogle() async {
    final usecase = Modular.get<LoginGoogleUsecase>();
    final apiResponse = await usecase.loginGoogleSignIn();
    if (apiResponse.ok) {
      print(apiResponse.result);
      Modular.to.pushNamed('/projeto');
    } else {
      print(apiResponse.message);
    }
  }

  Future<void> logoutGoogle() async {
    final usecase = Modular.get<LogoutGoogleUsecase>();
    await usecase.logout();
    Modular.to.popAndPushNamed('/');
    print('Usuário deslogado');
  }
}
