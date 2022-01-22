import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/output/components/parcela_card.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/components/bar_button.dart';

class ProjetoPage extends StatefulWidget {
  final Project project;

  const ProjetoPage({required this.project});
  @override
  ProjetoPageState createState() => ProjetoPageState();
}

class ProjetoPageState extends ModularState<ProjetoPage, ProjetoStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.nome),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            topBar(),
            Expanded(
              child: buildListParcelas(),
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

  Widget buildListParcelas() {
    return FutureBuilder<List<Parcela>>(
      future: controller.getAllParcelas(widget.project.id.toString()),
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
              onTap: () => {},
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
          label: 'Parcelas',
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          onTap: () {},
        ),
        BarButton(
          label: 'Medições',
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
              left: BorderSide(color: Colors.grey),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
