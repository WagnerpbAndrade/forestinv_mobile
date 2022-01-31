import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/login_controller.dart';

import 'page_tile.dart';

class PageSection extends StatelessWidget {
  PageSection({Key? key}) : super(key: key);

  final loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Regras de Consistência',
          iconData: Icons.rule,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          label: 'Configurações',
          iconData: Icons.settings,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          label: 'Minha Conta',
          iconData: Icons.account_circle,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          label: 'Sair',
          iconData: Icons.exit_to_app,
          onTap: () => loginController.logoutGoogle(),
          highlighted: false,
        ),
      ],
    );
  }
}
