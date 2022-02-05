import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/controllers/projeto_controller.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/projeto_store.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../components/project_card.dart';
import '../components/search_dialog.dart';

class ProjetoPage extends StatefulWidget {
  @override
  ProjetoPageState createState() => ProjetoPageState();
}

class ProjetoPageState extends ModularState<ProjetoPage, ProjetoStore> {
  final projetoController = Modular.get<ProjetoController>();

  void openSearch() async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(
        currentSearch: controller.search,
      ),
    );
    if (search != null) controller.setSearch(search);
    print(search);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              if (controller.search.isEmpty) return Container();
              return GestureDetector(
                onTap: () => openSearch(),
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    return Container(
                      width: constraints.biggest.width,
                      child: Text(controller.search),
                    );
                  },
                ),
              );
            },
          ),
          actions: [
            Observer(
              builder: (_) {
                if (controller.search.isEmpty) {
                  return IconButton(
                    onPressed: () {
                      openSearch();
                    },
                    icon: const Icon(Icons.search),
                  );
                }
                return IconButton(
                  onPressed: () {
                    controller.setSearch('');
                  },
                  icon: const Icon(Icons.close),
                );
              },
            )
          ],
        ),
        body: buidListProjetos(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => projetoController.goToNewProject(null),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buidListProjetos() {
    return Observer(
      builder: (_) {
        if (controller.error.isNotEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                color: Colors.white,
                size: 100,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Ocorreu um erro!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          );
        }
        if (controller.projectsList.isEmpty) {
          return listProjects();
        }
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: controller.projectsList.length,
          itemBuilder: (_, index) {
            return ProjectCard(
              project: controller.projectsList[index],
              onTap: () => projetoController.goToParcelaPage(
                controller.projectsList[index],
              ),
              onPressedDelete: () {
                Alert(
                  type: AlertType.warning,
                  buttons: [
                    DialogButton(
                      child: const Text('Sim'),
                      onPressed: () {
                        projetoController.deleteProject(
                          controller.projectsList[index].id.toString(),
                        );
                        store.projectsList
                            .remove(controller.projectsList[index]);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Projeto deletado com sucesso',
                              style: TextStyle(
                                color: ColorsConst.textColorPrimary,
                              ),
                            ),
                            backgroundColor: ColorsConst.primary,
                            action: SnackBarAction(
                              label: 'Ok',
                              onPressed: () {},
                            ),
                            duration: const Duration(milliseconds: 1500),
                          ),
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
                  title: "Excluir projeto",
                  desc: 'Deseja continuar com a exclusão do projeto?',
                ).show();
              },
              onPressedUpdate: () {
                projetoController
                    .goToNewProject(controller.projectsList[index]);
              },
            );
          },
        );
      },
    );
  }

  Widget listProjects() {
    return FutureBuilder<List<Project>>(
      future: projetoController.getAllProject(),
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
          itemBuilder: (_, index) {
            return ProjectCard(
              project: projetos[index],
              onTap: () => projetoController.goToParcelaPage(
                projetos[index],
              ),
              onPressedDelete: () {
                Alert(
                  type: AlertType.warning,
                  buttons: [
                    DialogButton(
                      child: const Text('Sim'),
                      onPressed: () {
                        projetoController.deleteProject(
                          controller.projectsList[index].id.toString(),
                        );
                        store.projectsList.remove(projetos[index]);
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
                  title: "Excluir projeto",
                  desc: 'Deseja continuar com a exclusão do projeto?',
                ).show();
              },
              onPressedUpdate: () {
                projetoController.goToNewProject(projetos[index]);
              },
            );
          },
        );
      },
    );
  }
}
