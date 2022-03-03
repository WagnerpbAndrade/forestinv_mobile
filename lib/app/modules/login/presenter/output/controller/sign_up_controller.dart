import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/sign_up_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/infra/models/user_model.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/stores/regra_consistencia_store.dart';

class SignUpController {
  final TextEditingController txtEmailController = TextEditingController();
  final TextEditingController txtPasswordController = TextEditingController();
  final TextEditingController txtPasswordConfirmationController =
      TextEditingController();

  Future<ApiResponse> createUserFirebase() async {
    // final usecase = Modular.get<SignUpUsecase>();
    // final email = txtEmailController.text;
    // final password = txtPasswordController.text;

    // final response = await usecase.createUser(email, password);

    // if (response.ok) {
    //   final regraStore = Modular.get<RegraConsistenciaStore>();
    //   final UserModelFirebase user = response.result;
    //   await regraStore.salveAllRegrasByUser(user.uid);
    //   Modular.to.pop();
    //   return response;
    // }
    return ApiResponse.ok();
  }
}
