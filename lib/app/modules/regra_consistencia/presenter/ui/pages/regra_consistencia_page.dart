import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/widgets/empty_card.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/stores/regra_consistencia_store.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/ui/components/regra_consistencia_tile.dart';

class RegraConsistenciaPage extends StatefulWidget {
  @override
  RegraConsistenciaPageState createState() => RegraConsistenciaPageState();
}

class RegraConsistenciaPageState extends State<RegraConsistenciaPage> {
  final store = Modular.get<RegraConsistenciaStore>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Regras de Consistência'),
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
                      if (store.regraList.isEmpty) {
                        return const EmptyCard('Nenhuma regra encontrada.');
                      }
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: store.regraList.length,
                        itemBuilder: (_, index) {
                          return RegraConsistenciaTile(
                            regra: store.regraList[index],
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
    );
  }
}
