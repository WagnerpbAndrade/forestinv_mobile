import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/controllers/parcela_controller.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/stores/parcela_store.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/ui/components/parcela_card.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ParcelaListPage extends StatefulWidget {
  final Project project;

  const ParcelaListPage({required this.project});
  @override
  ParcelaListPageState createState() => ParcelaListPageState();
}

class ParcelaListPageState extends ModularState<ParcelaListPage, ParcelaStore> {
  final parcelaController = Modular.get<ParcelaController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projeto: ${widget.project.nome}'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: buildListParcelas(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => parcelaController.goToCreateParcelaPage(
            null, widget.project.id.toString()),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildListParcelas() {
    return FutureBuilder<List<Parcela>>(
      future: parcelaController
          .getAllParcelaByProject(widget.project.id.toString()),
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
        final List<Parcela> parcelas = snapshot.data as List<Parcela>;
        return ListView.builder(
          itemCount: parcelas.length,
          itemBuilder: (_, index) {
            return ParcelaCard(
              parcela: parcelas[index],
              onTap: () => parcelaController.goToMedicaoPage(parcelas[index]),
              onPressedUpdate: () {
                parcelaController.goToCreateParcelaPage(
                    parcelas[index], widget.project.id.toString(),
                    isNewParcela: false);
              },
              onPressedDelete: () {
                // Alert(
                //   type: AlertType.warning,
                //   buttons: [
                //     DialogButton(
                //       child: const Text('Sim'),
                //       onPressed: () {
                //         projetoController.deleteProject(
                //           controller.projectsList[index].id.toString(),
                //         );
                //         store.projectsList.remove(projetos[index]);
                //         Modular.to.pop();
                //       },
                //     ),
                //     DialogButton(
                //       child: const Text('Não'),
                //       onPressed: () {
                //         Modular.to.pop();
                //       },
                //     )
                //   ],
                //   context: context,
                //   title: "Excluir projeto",
                //   desc: 'Deseja continuar com a exclusão do projeto?',
                // ).show();
              },
            );
          },
        );
      },
    );
  }
}
