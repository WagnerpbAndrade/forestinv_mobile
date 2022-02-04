import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_button.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_text_form_field.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/recovery_password_controller.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/recovery_password_store.dart';

class RecoveryPasswordPage extends StatelessWidget {
  const RecoveryPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<RecoveryPasswordStore>();
    final controller = Modular.get<RecoveryPasswordController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorsConst.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Container(
            margin: const EdgeInsets.only(right: 56),
            child: const Text(
              "Esqueci a senha",
              style: TextStyle(color: ColorsConst.primary),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Informe o email para enviarmos o link para recuperação de senha",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              Observer(builder: (context) {
                return CustomTextFormField(
                  controller: controller.txtEmailController,
                  label: "seu.email@exemplo.com",
                  icon: const Icon(
                    Icons.email,
                    color: ColorsConst.primary,
                  ),
                  onChanged: (value) {
                    store.email = value.toString();

                    store.validarEmail();
                  },
                  textError: store.textoErroEmail,
                  valido: store.errorEmail,
                  isPassWord: false,
                  textType: TextInputType.emailAddress,
                );
              }),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                action: () async {
                  if (store.validarEmail()) {
                    final response = await controller.recoveryPassword();
                    if (response.ok) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            response.message ?? '',
                            style: const TextStyle(
                              color: ColorsConst.textColorPrimary,
                            ),
                          ),
                          backgroundColor: ColorsConst.primary,
                          action: SnackBarAction(
                            textColor: ColorsConst.textColorPrimary,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                      Modular.to.pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            response.message ?? '',
                            style: const TextStyle(
                              color: ColorsConst.textColorPrimary,
                            ),
                          ),
                          backgroundColor: ColorsConst.primary,
                          action: SnackBarAction(
                            textColor: ColorsConst.textColorPrimary,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                    }
                  }
                },
                title: "ENVIAR",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
