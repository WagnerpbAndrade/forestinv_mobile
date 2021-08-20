import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/widgets/gb_floating_action_button.dart';
import 'package:forestinv_mobile/app/modules/projeto/constants/ui_text.dart';
import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/project_controller.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';

class ProjetoPage extends StatefulWidget {
  @override
  ProjetoPageState createState() => ProjetoPageState();
}

class ProjetoPageState extends State<ProjetoPage> {
  final controller = Modular.get<ProjectController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(UIText.PROJECT_UI_TEXT),
          centerTitle: true,
        ),
        body: SafeArea(
          child: FutureBuilder<List<Project>?>(
            future: controller.getAllProject(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.green,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Erro ao carregar projetos. Tente novamente mais tarde"),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, id) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Color(snapshot.data![id].hashCode).withAlpha(200),
                      child: Text(snapshot.data![id].nome.characters
                          .characterAt(0)
                          .toUpperCase()
                          .toString()),
                    ),
                    title: Text(snapshot.data![id].nome),
                    //subtitle: Text(snapshot.data![id].endereco.cidade),
                    onTap: () => {print(snapshot.data![id].nome)},
                  );
                },
              );
            },
          ),
        ),
        floatingActionButton: GbFloatingActionButton(
          onPressed: () {},
          icon: Icons.add,
        ));
  }
}
