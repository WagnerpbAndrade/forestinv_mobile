import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/home_store.dart';

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
            const Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  GestureDetector(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(Icons.account_circle),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Minha conta'),
                      ],
                    ),
                    onTap: () {
                      homeStore.goToAccountPage();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(Icons.rule),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Regras de Consistência'),
                      ],
                    ),
                    onTap: () {
                      homeStore.goToRegrasConsistenciaPage();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Icon(Icons.settings),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Configurações'),
                        ],
                      ),
                      onTap: () {
                        homeStore.goToSettingsPage();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Icon(Icons.info_outline),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Sobre'),
                        ],
                      ),
                      onTap: () {
                        homeStore.goToAboutAppPage();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Sair'),
                        ],
                      ),
                      onTap: () => authStore.logoutGoogle(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Center(
                      child: Text(
                        'v1.0.0',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
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
