import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/controllers/create_medicao_controller.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/controllers/medicao_list_controller.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/stores/medicao_store.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../components/bar_button.dart';
import '../components/medicao_card.dart';

class MedicaoListPage extends StatefulWidget {
  final Parcela parcela;

  const MedicaoListPage({required this.parcela});
  @override
  MedicaoListPageState createState() => MedicaoListPageState();
}

class MedicaoListPageState extends ModularState<MedicaoListPage, MedicaoStore> {
  final medicaoListController = Modular.get<MedicaoListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcela: ${widget.parcela.numero.toString()}'),
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
            topBar(),
            Expanded(
              child: buildListMedicoes(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          medicaoListController.goToCreateMedicaoPage(
            null,
            widget.parcela.id.toString(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildListMedicoes() {
    return FutureBuilder<List<Medicao>>(
      future: medicaoListController
          .getAllMedicaoByParcela(widget.parcela.id.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return Container();
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text("Servidor indisponível no momento"),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final List<Medicao> medicoes = snapshot.data as List<Medicao>;
        return ListView.builder(
          itemCount: medicoes.length,
          itemBuilder: (_, index) {
            return MedicaoCard(
              medicao: medicoes[index],
              onTap: () => {},
              onPressedUpdate: () {
                medicaoListController.goToCreateMedicaoPage(
                  medicoes[index],
                  widget.parcela.id.toString(),
                );
              },
              onPressedDelete: () {
                Alert(
                  type: AlertType.warning,
                  buttons: [
                    DialogButton(
                      child: const Text('Sim'),
                      onPressed: () {
                        medicaoListController.delete(
                          medicoes[index].id.toString(),
                        );
                        //store.projectsList.remove(projetos[index]);
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
                  title: "Excluir medição",
                  desc: 'Deseja continuar com a exclusão da medição?',
                ).show();
              },
            );
          },
        );
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
