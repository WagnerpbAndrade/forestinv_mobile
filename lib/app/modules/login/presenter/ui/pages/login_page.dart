import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_elevated_button.dart';
import 'package:forestinv_mobile/app/core/widgets/error_box.dart';
import 'package:forestinv_mobile/app/core/widgets/replace_raisedbutton.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/login_store.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/widgets/components/logo_login.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/widgets/components/or_divider.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = Modular.get<LoginStore>();

  final authStore = Modular.get<AuthStore>();

  @override
  void initState() {
    super.initState();

    when((_) => authStore.user != null, () {
      store.goToHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LogoLogin(),
                  Observer(
                    builder: (_) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        height: 40,
                        child: ReplaceRaisedButton(
                          color: ColorsConst.primary,
                          textColor: Colors.white,
                          disabledColor: ColorsConst.primary.withAlpha(120),
                          child: store.loadingGoogle
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Entrar com Google',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          onPressed: store.googleOnPressed,
                        ),
                      );
                    },
                  ),
                  OrDivider(),
                  const Text(
                    'Acessar com e-mail:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ErrorBox(
                          message: store.error,
                        ),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Text(
                      'E-mail',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: store.emailError),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: store.setEmail,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Senha',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          child: const Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            Modular.to.pushNamed(
                                RouterConst.RECOVERY_PASSWORD_ROUTER,
                                arguments: store.email);
                          },
                        )
                      ],
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: store.passwordError),
                        obscureText: true,
                        onChanged: store.setPassword,
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return CustomElevatedButton(
                        onPressed: store.loginOnPressed,
                        child: store.loading
                            ? const CircularProgressIndicator()
                            : const Text(
                                'ENTRAR',
                              ),
                      );
                    },
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          'Não tem uma conta? ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed(RouterConst.SIGN_UP_ROUTER);
                          },
                          child: const Text(
                            'Cadastre-se',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
