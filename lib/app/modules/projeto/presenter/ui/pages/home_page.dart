import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:forestinv_mobile/app/core/widgets/empty_card.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/home_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/components/create_projeto_button.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/components/projeto_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final ScrollController scrollController = ScrollController();

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
                            valueColor: AlwaysStoppedAnimation(Colors.white),
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
                          if (index < store.projetoList.length) {
                            return ProjetoTile(
                              projeto: store.projetoList[index],
                            );
                          }

                          return Container(
                            height: 10,
                            child: const LinearProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.purple),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Positioned(
                    bottom: -50,
                    left: 0,
                    right: 0,
                    child: CreateProjetoButton(scrollController),
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
