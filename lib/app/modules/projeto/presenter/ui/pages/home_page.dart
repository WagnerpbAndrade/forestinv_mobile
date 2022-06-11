import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:forestinv_mobile/app/core/widgets/empty_card.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/home_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/components/projeto_tile.dart';
import 'package:forestinv_mobile/app/stores/connectivity_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final connectivityStore = Modular.get<ConnectivityStore>();
  final ScrollController scrollController = ScrollController();
  final Connectivity _connectivity = Connectivity();
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
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Observer(
                    builder: (_) {
                      if (store.error != null) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.error,
                                color: Colors.white,
                                size: 100,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Ocorreu um erro!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      if (store.showProgress) {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation(ColorsConst.primary),
                          ),
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
}
