import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/recovery_password_usecase.dart';

class RecoveryPasswordController {
  final TextEditingController txtEmailController = TextEditingController();

  Future<ApiResponse> recoveryPassword() {
    final usecase = Modular.get<RecoveryPasswordUsecase>();
    final email = txtEmailController.text;

    return usecase.recoveryPassword(email);
  }
}
