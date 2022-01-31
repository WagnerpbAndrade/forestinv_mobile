import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_text_form_field.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/login_controller.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/login_store.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/widgets/components/login_button.dart';

class FormLogin extends StatelessWidget {
  final store = Modular.get<LoginStore>();
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Observer(builder: (context) {
            return CustomTextFormField(
              controller: controller.emailController,
              label: "Email",
              icon: const Icon(
                Icons.email,
                color: ColorsConst.secondary,
              ),
              onChanged: (value) {
                store.email = value.toString();
                store.validarEmail();
              },
              textError: emailError(),
              valido: !store.temErroFirebase
                  ? store.errorEmail
                  : store.temErroFirebase,
              isPassWord: false,
              textType: TextInputType.emailAddress,
            );
          }),
          Observer(
            builder: (context) {
              return CustomTextFormField(
                controller: controller.passwordController,
                label: "Senha",
                icon: const Icon(
                  Icons.lock,
                  color: ColorsConst.secondary,
                ),
                onChanged: (value) {
                  store.email = value.toString();
                  store.validarSenha();
                },
                textError: store.textoErroSenha,
                valido: store.erroSenha,
                isPassWord: true,
                textType: TextInputType.text,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Observer(builder: (context) {
            store.botaoLoading;
            return LoginButton(
              onPressed: () {
                if (store.validarEmail() && store.validarSenha()) {
                  controller.siginWithEmailAndPassword();
                }
              },
              title: "ENTRAR",
            );
          }),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "OU",
            style: TextStyle(
                color: ColorsConst.textColorPrimary,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  emailError() {
    if (store.errorEmail) {
      return store.textoErroEmail;
    } else if (store.temErroFirebase) {
      return store.textoErroFirebase;
    }
    return "";
  }
}
