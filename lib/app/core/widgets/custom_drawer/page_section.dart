import 'package:flutter/material.dart';

import 'page_tile.dart';

class PageSection extends StatelessWidget {
  const PageSection({Key? key}) : super(key: key);

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
          onTap: () {},
          highlighted: false,
        ),
      ],
    );
  }
}
