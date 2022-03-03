import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_elevated_button.dart';
import 'package:forestinv_mobile/app/core/widgets/error_box.dart';
import 'package:forestinv_mobile/app/core/widgets/field_title.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/sign_up_store.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Modular.get<SignUpStore>();

    return Scaffold(
      backgroundColor: ColorsConst.primary,
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 8,
              child: Observer(
                builder: (_) {
                  if (store.loading) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Text(
                            'Cadastrando Usuário',
                            style:
                                TextStyle(fontSize: 18, color: Colors.purple),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.purple),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Observer(
                            builder: (_) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ErrorBox(
                                  message: store.error,
                                ),
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Nome',
                            subtitle: 'Como aparecerá no aplicativo',
                          ),
                          Observer(
                            builder: (_) {
                              return TextField(
                                enabled: !store.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Exemplo: Wagner Andrade',
                                    isDense: true,
                                    errorText: store.nomeError),
                                onChanged: store.setName,
                                keyboardType: TextInputType.name,
                                maxLength: 100,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const FieldTitle(
                            title: 'E-mail',
                            subtitle: 'Enviaremos um e-mail de confirmação',
                          ),
                          Observer(
                            builder: (_) {
                              return TextField(
                                enabled: !store.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Exemplo: wagner@gmail.com',
                                    isDense: true,
                                    errorText: store.emailError),
                                onChanged: store.setEmail,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const FieldTitle(
                            title: 'Celular',
                            subtitle: 'Proteja sua conta',
                          ),
                          Observer(
                            builder: (_) {
                              return TextField(
                                enabled: !store.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: '(99) 99999-9999',
                                    isDense: true,
                                    errorText: store.phoneError),
                                onChanged: store.setPhone,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  TelefoneInputFormatter(),
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const FieldTitle(
                            title: 'Senha',
                            subtitle:
                                'Use letras, números e caracteres especiais',
                          ),
                          Observer(
                            builder: (_) {
                              return TextField(
                                enabled: !store.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    isDense: true,
                                    errorText: store.pass1Error),
                                onChanged: store.setPass1,
                                obscureText: true,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const FieldTitle(
                            title: 'Confirmar Senha',
                            subtitle: 'Repita a senha',
                          ),
                          Observer(
                            builder: (_) {
                              return TextField(
                                enabled: !store.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    isDense: true,
                                    errorText: store.pass2Error),
                                onChanged: store.setPass2,
                                obscureText: true,
                              );
                            },
                          ),
                          Observer(
                            builder: (_) {
                              return CustomElevatedButton(
                                onPressed: store.signUpPressed,
                                child: store.loading
                                    ? const CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                      )
                                    : const Text(
                                        'CADASTRAR',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                              );
                            },
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                const Text(
                                  'Já tem uma conta? ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                GestureDetector(
                                  onTap: () => Modular.to.pop(),
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: ColorsConst.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
