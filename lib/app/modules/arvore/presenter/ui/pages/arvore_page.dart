import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/controllers/arvore_controller.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/components/arvore_card.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ArvorePage extends StatefulWidget {
  final Medicao medicao;

  const ArvorePage(this.medicao);

  @override
  ArvorePageState createState() => ArvorePageState();
}

class ArvorePageState extends State<ArvorePage> {
  final ArvoreStore store = Modular.get<ArvoreStore>();
  final arvoreController = Modular.get<ArvoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medição: ${widget.medicao.dataMedicao!.year}'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            //topBar(),
            Expanded(
              child: buildListMedicoes(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          arvoreController.goToCreateArvorePage(
            null,
            widget.medicao.id.toString(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildListMedicoes() {
    return FutureBuilder<List<Arvore>>(
      future:
          arvoreController.getAllArvoresByMedicao(widget.medicao.id.toString()),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                children: [
                  const Text('Carregando árvores'),
                  const CircularProgressIndicator(),
                ],
              ),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Center(
                child: Text("Erro ao carregar os dados!"),
              );
            } else {
              final List<Arvore>? arvores = snapshot.data as List<Arvore>;
              if (arvores != null && arvores.isNotEmpty) {
                return ListView.builder(
                  itemCount: arvores.length,
                  itemBuilder: (_, index) {
                    return ArvoreCard(
                      arvore: arvores[index],
                      onTap: () => {},
                      onPressedUpdate: () {
                        arvoreController.goToCreateArvorePage(
                          arvores[index],
                          widget.medicao.id.toString(),
                        );
                      },
                      onPressedDelete: () {
                        Alert(
                          type: AlertType.warning,
                          buttons: [
                            DialogButton(
                              child: const Text('Sim'),
                              onPressed: () {
                                arvoreController.delete(
                                  arvores[index].id.toString(),
                                );
                                Modular.to.pop();
                              },
                            ),
                            DialogButton(
                              child: const Text('Não'),
                              onPressed: () {
                                Modular.to.pop();
                              },
                            )
                          ],
                          context: context,
                          title: "Excluir Árvore",
                          desc: 'Deseja continuar com a exclusão da árvore?',
                        ).show();
                      },
                    );
                  },
                );
              }

              return const Center(
                child: Text("Nenhuma árvore encontrada!"),
              );
            }
        }
      },
    );
  }
}
