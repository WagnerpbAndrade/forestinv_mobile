import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/empty_card.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/stores/parcela_store.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/ui/components/parcela_tile.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';

class ParcelaPage extends StatefulWidget {
  final Project project;

  const ParcelaPage({required this.project});

  @override
  _ParcelaPageState createState() => _ParcelaPageState();
}

class _ParcelaPageState extends State<ParcelaPage> {
  ParcelaStore? store;
  @override
  void initState() {
    super.initState();
    store = ParcelaStore(project: widget.project);
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Parcelas'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: ColorsConst.secondaryVariant,
                elevation: 8,
                child: Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Text(
                        'Parcelas referente ao projeto: ${widget.project.nome}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
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
                      if (store!.parcelaList.isEmpty) {
                        return const EmptyCard('Nenhuma parcela encontrada.');
                      }
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: store!.parcelaList.length,
                        itemBuilder: (_, index) {
                          return ParcelaTile(
                            store: store!,
                            parcela: store!.parcelaList[index],
                            onTap: () {
                              store!.goToMedicaoPage(
                                  store!.parcelaList[index], widget.project.id);
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
            await store!.goToCadastrarParcelaPage(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
