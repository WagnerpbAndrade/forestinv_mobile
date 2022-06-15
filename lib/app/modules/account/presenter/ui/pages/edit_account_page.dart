import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/replace_raisedbutton.dart';
import 'package:forestinv_mobile/app/modules/account/presenter/output/stores/edit_account_store.dart';

class EditAccountPage extends StatelessWidget {
  final EditAccountStore store = EditAccountStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        initialValue: store.name,
                        enabled: !store.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          labelText: 'Nome*',
                          errorText: store.nameError,
                        ),
                        onChanged: store.setName,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  if (!store.isSocialLogin)
                    Column(
                      children: [
                        Observer(builder: (_) {
                          return TextFormField(
                            enabled: !store.loading,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'Nova Senha',
                            ),
                            obscureText: true,
                            onChanged: store.setPass1,
                          );
                        }),
                        const SizedBox(height: 8),
                        Observer(builder: (_) {
                          return TextFormField(
                            enabled: !store.loading,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              isDense: true,
                              labelText: 'Confirmar Nova Senha',
                              errorText: store.passError,
                            ),
                            obscureText: true,
                            onChanged: store.setPass2,
                          );
                        }),
                      ],
                    ),
                  const SizedBox(height: 12),
                  Observer(
                    builder: (_) {
                      return SizedBox(
                        height: 40,
                        child: ReplaceRaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: ColorsConst.secondary,
                          disabledColor: ColorsConst.secondary.withAlpha(100),
                          elevation: 0,
                          textColor: Colors.white,
                          child: store.loading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text('Salvar'),
                          onPressed: store.savePressed,
                        ),
                      );
                    },
                  ),
                  // const SizedBox(height: 8),
                  // Observer(
                  //   builder: (_) {
                  //     return SizedBox(
                  //       height: 40,
                  //       child: ReplaceRaisedButton(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //         color: Colors.red,
                  //         disabledColor: Colors.red.withAlpha(100),
                  //         elevation: 0,
                  //         textColor: Colors.white,
                  //         child: store.loading
                  //             ? const CircularProgressIndicator(
                  //                 valueColor:
                  //                     AlwaysStoppedAnimation(Colors.white),
                  //               )
                  //             : const Text('Sair'),
                  //         onPressed: () {},
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
