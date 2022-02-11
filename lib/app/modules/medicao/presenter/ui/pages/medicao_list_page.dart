import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/controllers/medicao_list_controller.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/stores/medicao_store.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';

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
        final List<Medicao> parcelas = snapshot.data as List<Medicao>;
        return ListView.builder(
          itemCount: parcelas.length,
          itemBuilder: (_, index) {
            return MedicaoCard(
              medicao: parcelas[index],
              onTap: () => {},
              onPressedUpdate: () {},
              onPressedDelete: () {},
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
