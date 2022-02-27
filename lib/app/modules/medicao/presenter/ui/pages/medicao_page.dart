import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forestinv_mobile/app/core/widgets/empty_card.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/stores/medicao_store.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/ui/components/medicao_tile.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';

class MedicaoPage extends StatefulWidget {
  final Parcela parcela;

  const MedicaoPage({required this.parcela});

  @override
  _MedicaoPageState createState() => _MedicaoPageState();
}

class _MedicaoPageState extends State<MedicaoPage> {
  MedicaoStore? store;
  @override
  void initState() {
    super.initState();
    store = MedicaoStore(parcela: widget.parcela);
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Medições'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Observer(
                    builder: (_) {
                      if (store!.error != null) {
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
                      if (store!.showProgress) {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        );
                      }
                      if (store!.medicaoList.isEmpty) {
                        return const EmptyCard('Nenhuma medição encontrada.');
                      }
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: store!.medicaoList.length,
                        itemBuilder: (_, index) {
                          return MedicaoTile(
                            store: store!,
                            medicao: store!.medicaoList[index],
                            onTap: () {
                              //store!.goToMedicaoPage(store!.medicaoList[index]);
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
            await store!.goToCadastrarMedicaoPage(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}