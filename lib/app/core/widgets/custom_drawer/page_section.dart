import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/login_controller.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/home_store.dart';

import 'page_tile.dart';

class PageSection extends StatelessWidget {
  PageSection({Key? key}) : super(key: key);

  final loginController = Modular.get<LoginController>();
  final homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          Column(
            children: [
              PageTile(
                label: 'Minha Conta',
                iconData: Icons.account_circle,
                onTap: () {},
                highlighted: false,
              ),
              PageTile(
                label: 'Regras de Consistência',
                iconData: Icons.rule,
                onTap: () {
                  homeStore.goToRegrasConsistenciaPage();
                },
                highlighted: false,
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(
                  color: Colors.black54,
                  thickness: 1,
                ),
                PageTile(
                  label: 'Configurações',
                  iconData: Icons.settings,
                  onTap: () {},
                  highlighted: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PageTile(
                    label: 'Sair',
                    iconData: Icons.logout,
                    onTap: () => loginController.logoutGoogle(),
                    highlighted: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
