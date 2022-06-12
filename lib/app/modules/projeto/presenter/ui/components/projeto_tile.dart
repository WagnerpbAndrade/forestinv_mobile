import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/dialog_platform.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/home_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/pages/cadastrar_projeto_page.dart';
import 'package:forestinv_mobile/app/screens/offline/offline_screen.dart';
import 'package:forestinv_mobile/app/stores/connectivity_store.dart';
import 'package:forestinv_mobile/helper/extensions.dart';

class ProjetoTile extends StatelessWidget {
  ProjetoTile({required this.projeto, this.onTap, required this.homeStore});

  final Project projeto;
  final Function? onTap;
  final HomeStore homeStore;

  final List<MenuChoice> choices = [
    MenuChoice(index: 0, title: 'Editar', iconData: Icons.edit),
    MenuChoice(index: 1, title: 'Excluir', iconData: Icons.delete),
    MenuChoice(index: 2, title: 'Exportar', iconData: Icons.share)
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? null : () => onTap!(),
      child: Container(
        height: 135,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Row(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: IconButton(
                  onPressed: null,
                  icon: Image.asset('assets/images/location.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nome: ${projeto.nome}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Área: ${projeto.area.toString()} ha',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (projeto.visibilidadeProjetoEnum.toUpperCase() ==
                          'PRIVADO')
                        const Icon(
                          Icons.lock,
                          size: 16,
                          color: ColorsConst.primary,
                        )
                      else
                        const Icon(
                          Icons.lock_open,
                          size: 16,
                          color: ColorsConst.secondary,
                        ),
                      Text(
                        'Criado em ${projeto.dataCriacao!.formattedDate()}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  PopupMenuButton<MenuChoice>(
                    onSelected: (choice) {
                      switch (choice.index) {
                        case 0:
                          editProject(context);
                          break;
                        case 1:
                          deleteProject(context);
                          break;
                        case 2:
                          exportarProject(context, projeto.id);
                          break;
                      }
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      size: 20,
                      color: Colors.purple,
                    ),
                    itemBuilder: (_) {
                      return choices
                          .map(
                            (choice) => PopupMenuItem<MenuChoice>(
                              value: choice,
                              child: Row(
                                children: [
                                  Icon(
                                    choice.iconData,
                                    size: 20,
                                    color: Colors.purple,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    choice.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.purple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editProject(BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CadastrarProjetoPage(projeto: projeto),
      ),
    );
    if (success != null && success) homeStore.refresh();
  }

  void deleteProject(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => DialogPlatform(
              title: 'Excluído',
              content: 'Confirmar a exclusão do projeto \'${projeto.nome}\'?',
              textNoButton: 'Não',
              textYesButton: 'Sim',
              actionNo: () => Navigator.of(context).pop(),
              actionYes: () async {
                homeStore.deleteProject(projeto.id);
                Navigator.of(context).pop();
              },
            ));
  }

  Future<void> exportarProject(
      BuildContext context, final String projetoId) async {
    final connectivityStore = Modular.get<ConnectivityStore>();
    if (!connectivityStore.connected) {
      Future.delayed(const Duration(milliseconds: 50)).then((value) {
        showDialog(context: context, builder: (_) => OfflineScreen());
      });
    } else {
      await homeStore.fetchAllDataForExportCsv(projetoId, context);
    }
  }
}

class MenuChoice {
  MenuChoice(
      {required this.index, required this.title, required this.iconData});

  final int index;
  final String title;
  final IconData iconData;
}
