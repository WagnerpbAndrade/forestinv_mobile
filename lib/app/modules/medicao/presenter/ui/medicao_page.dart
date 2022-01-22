import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/medicao_store.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';

import 'components/medicao_card.dart';

class MedicaoPage extends StatefulWidget {
  final Parcela parcela;

  const MedicaoPage({required this.parcela});
  @override
  MedicaoPageState createState() => MedicaoPageState();
}

class MedicaoPageState extends ModularState<MedicaoPage, MedicaoStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.parcela.numero.toString()),
        centerTitle: true,
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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildListMedicoes() {
    return FutureBuilder<List<Medicao>>(
      future: controller.getAllMedicaoByParcela(widget.parcela.id.toString()),
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
            );
          },
        );
      },
    );
  }
}
