import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/replace_flatbutton.dart';
import 'package:forestinv_mobile/app/modules/account/presenter/output/stores/account_store.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';

class AccountPage extends StatefulWidget {
  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final store = Modular.get<AccountStore>();
  final authStore = Modular.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 140,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Observer(
                            builder: (_) {
                              return Text(
                                authStore.isLoggedIn
                                    ? authStore.user!.nome
                                    : 'Complete seu cadastro',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: ColorsConst.primary,
                                  fontWeight: FontWeight.w900,
                                ),
                              );
                            },
                          ),
                          Text(
                            authStore.user!.email,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: ReplaceFlatButton(
                        child: const Text('Editar'),
                        textColor: ColorsConst.primary,
                        onPressed: () {
                          store.goToEditAccount();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
