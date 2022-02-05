import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/sign_up_usecase.dart';

class SignUpController {
  final TextEditingController txtEmailController = TextEditingController();
  final TextEditingController txtPasswordController = TextEditingController();
  final TextEditingController txtPasswordConfirmationController =
      TextEditingController();

  Future<ApiResponse> createUserFirebase() async {
    final usecase = Modular.get<SignUpUsecase>();
    final email = txtEmailController.text;
    final password = txtPasswordController.text;

    final response = await usecase.createUser(email, password);

    if (response.ok) {
      Modular.to.pop();
      return response;
    }
    return response;
  }
}
