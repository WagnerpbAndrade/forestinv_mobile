import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_with_email_password_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/logout_google_usecase.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<ApiResponse> siginWithEmailAndPassword() async {
    final usecase = Modular.get<LoginWithEmailPasswordUsecase>();
    final email = emailController.text;
    final password = passwordController.text;

    print('E-mail: $email - Password: $password');

    final response = await usecase.loginWithEmailAndPassword(email, password);
    if (response.ok) {
      print('User: ${response.result.toString()}');
      Modular.to.pushNamed('/projeto');
      return response;
    }
    print(response.message);
    return response;
  }

  Future<ApiResponse> loginWithGoogle() async {
    final usecase = Modular.get<LoginGoogleUsecase>();
    final apiResponse = await usecase.loginGoogleSignIn();
    if (apiResponse.ok) {
      print(apiResponse.result);
      Modular.to.pushNamed('/projeto');
      return apiResponse;
    }
    print(apiResponse.message);
    return apiResponse;
  }

  Future<void> logoutGoogle() async {
    final usecase = Modular.get<LogoutGoogleUsecase>();
    await usecase.logout();
    Modular.to.popAndPushNamed(RouterConst.INITIAL_ROUTER);
    print('Usuário deslogado');
  }

  void goToRecoveryPasswordPage() {
    Modular.to.pushNamed(RouterConst.RECOVERY_PASSWORD_ROUTER);
  }

  void goToSignUpPage() {
    Modular.to.pushNamed(RouterConst.SIGN_UP_ROUTER);
  }
}
