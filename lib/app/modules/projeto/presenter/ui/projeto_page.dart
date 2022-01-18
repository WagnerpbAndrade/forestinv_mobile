import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/project_controller.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/components/search_dialog.dart';

class ProjetoPage extends StatefulWidget {
  @override
  ProjetoPageState createState() => ProjetoPageState();
}

class ProjetoPageState extends State<ProjetoPage> {
  final controller = Modular.get<ProjectController>();
  final ProjetoStore projetoStore = Modular.get<ProjetoStore>();

  void openSearch() async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(
        currentSearch: projetoStore.search,
      ),
    );
    if (search != null) projetoStore.setSearch(search);
    print(search);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          child: Container(
            width: 200,
          ),
        ),
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              if (projetoStore.search.isEmpty) return Container();
              return GestureDetector(
                onTap: () => openSearch(),
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    return Container(
                      width: constraints.biggest.width,
                      child: Text(projetoStore.search),
                    );
                  },
                ),
              );
            },
          ),
          actions: [
            Observer(
              builder: (_) {
                if (projetoStore.search.isEmpty)
                  return IconButton(
                    onPressed: () {
                      openSearch();
                    },
                    icon: const Icon(Icons.search),
                  );
                return IconButton(
                  onPressed: () {
                    projetoStore.setSearch('');
                  },
                  icon: const Icon(Icons.close),
                );
              },
            )
          ],
        ),
        body: listProjects(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget listProjects() {
    return FutureBuilder<List<Project>>(
      future: controller.getAllProject(),
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
        final List<Project> projetos = snapshot.data as List<Project>;
        return ListView.builder(
          itemCount: projetos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(projetos[index].nome),
              subtitle: Text("Área: ${projetos[index].area.toString()}"),
            );
          },
        );
      },
    );
  }
}
