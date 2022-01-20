import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/components/bar_button.dart';

class ProjetoPage extends StatefulWidget {
  final Project project;

  const ProjetoPage({required this.project});
  @override
  ProjetoPageState createState() => ProjetoPageState();
}

class ProjetoPageState extends State<ProjetoPage> {
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
              child: conteudo(),
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

  Widget conteudo() {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text('Parcela $index'),
          );
        });
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
