import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/controllers/arvore_controller.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/components/arvore_card.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/ui/components/bar_button.dart';
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
              final List<Arvore>? medicoes = snapshot.data as List<Arvore>;
              if (medicoes != null && medicoes.isNotEmpty) {
                return ListView.builder(
                  itemCount: medicoes.length,
                  itemBuilder: (_, index) {
                    return ArvoreCard(
                      arvore: medicoes[index],
                      onTap: () => {},
                      onPressedUpdate: () {
                        // medicaoListController.goToCreateMedicaoPage(
                        //   medicoes[index],
                        //   widget.medicao.id.toString(),
                        // );
                      },
                      onPressedDelete: () {
                        Alert(
                          type: AlertType.warning,
                          buttons: [
                            DialogButton(
                              child: const Text('Sim'),
                              onPressed: () {
                                // medicaoListController.delete(
                                //   medicoes[index].id.toString(),
                                // );
                                // //store.projectsList.remove(projetos[index]);
                                // Modular.to.pop();
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

  Row topBar() {
    return Row(
      children: [
        BarButton(
          label: 'Filtros',
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
