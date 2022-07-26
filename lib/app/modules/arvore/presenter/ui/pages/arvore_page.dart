import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/empty_card.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/components/arvore_tile.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/helper/extensions.dart';

class ArvorePage extends StatefulWidget {
  final List args;

  const ArvorePage(this.args);

  @override
  ArvorePageState createState() => ArvorePageState();
}

class ArvorePageState extends State<ArvorePage> {
  ArvoreStore? store;
  @override
  void initState() {
    super.initState();
    store = ArvoreStore(medicao: widget.args[0], projetoId: widget.args[1]);
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final Medicao medicao = widget.args[0];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Árvores'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 8,
                child: Center(
                  child: Column(
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          Text(
                            'Árvores referente a medição: ${medicao.identificador}',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          Text(
                            'Data da medição: ${medicao.dataMedicao!.formattedDate()}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                                size: 100,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Ocorreu um erro!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (store!.arvoreList.isEmpty) {
                        return const EmptyCard('Nenhuma árvore encontrada.');
                      }
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: store!.arvoreList.length,
                        itemBuilder: (_, index) {
                          return ArvoreTile(
                            store: store!,
                            arvore: store!.arvoreList[index],
                            onTap: () {
                              //store!.goToArvorePage(store!.medicaoList[index]);
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
            await store!.goToCadastrarArvorePage(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
