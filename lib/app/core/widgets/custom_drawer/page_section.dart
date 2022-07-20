import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/home_store.dart';

import 'page_tile.dart';

class PageSection extends StatelessWidget {
  PageSection({Key? key}) : super(key: key);

  final authStore = Modular.get<AuthStore>();
  final homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return NewWidget(homeStore: homeStore, authStore: authStore);
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.homeStore,
    required this.authStore,
  }) : super(key: key);

  final HomeStore homeStore;
  final AuthStore authStore;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          children: [
            Column(
              children: [
                PageTile(
                  label: 'Minha Conta',
                  iconData: Icons.account_circle,
                  onTap: () {
                    homeStore.goToAccountPage();
                  },
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
                    onTap: () {
                      homeStore.goToSettingsPage();
                    },
                    highlighted: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PageTile(
                      label: 'Sair',
                      iconData: Icons.logout,
                      onTap: () => authStore.logoutGoogle(),
                      highlighted: false,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Center(
                      child: Text(
                        'v1.0.0',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
