import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_alert_dialog.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:forestinv_mobile/app/core/widgets/empty_card.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/home_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/components/projeto_tile.dart';
import 'package:forestinv_mobile/app/stores/connectivity_store.dart';
import 'package:forestinv_mobile/app/stores/theme_configuration_store.dart';
import 'package:group_radio_button/group_radio_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final connectivityStore = Modular.get<ConnectivityStore>();
  final ScrollController scrollController = ScrollController();
  final ThemeConfigurationStore themeConfigurationStore =
      Modular.get<ThemeConfigurationStore>();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_updateStatus);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text('Projetos'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                _openThemePage();
              },
              icon: const Icon(Icons.brightness_4),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Observer(
                      builder: (_) {
                        if (store.loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (store.error != null) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Icon(
                                  Icons.error,
                                  size: 100,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  store.error ??
                                      'Ocorreu um erro. Tente novamente.',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        if (store.showProgress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (store.projetoList.isEmpty) {
                          return const EmptyCard('Nenhum projeto encontrado.');
                        }
                        return ListView.builder(
                          controller: scrollController,
                          itemCount: store.projetoList.length,
                          itemBuilder: (_, index) {
                            return ProjetoTile(
                              homeStore: store,
                              projeto: store.projetoList[index],
                              onTap: () {
                                store.goToParcelaPage(store.projetoList[index]);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await store.goToCadastrarProjetoPage(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _updateStatus(ConnectivityResult connectivityResult) {
    print("Conexão: ${ConnectivityResult.values[connectivityResult.index]}");
    connectivityStore
        .setConnected(connectivityResult != ConnectivityResult.none);
    print('Está conectado: ${connectivityStore.connected}');
  }

  void _openThemePage() {
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Center(child: Text('Alterar Tema')),
            alignment: Alignment.center,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioGroup<String>.builder(
                  groupValue: themeConfigurationStore.selectedTheme,
                  onChanged: (val) {
                    print('Selected: $val');
                    setState(() {
                      themeConfigurationStore.selectedTheme = val!;
                    });
                    themeConfigurationStore.onThemeChange(val!);
                  },
                  items: themeConfigurationStore.themes,
                  activeColor: Colors.pink,
                  itemBuilder: (item) => RadioButtonBuilder(item,
                      textPosition: RadioButtonTextPosition.right),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
