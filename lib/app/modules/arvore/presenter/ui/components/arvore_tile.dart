import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_card_list.dart';
import 'package:forestinv_mobile/app/core/widgets/dialog_platform.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/pages/cadastrar_arvore_page.dart';
import 'package:forestinv_mobile/helper/toast_helper.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:toast/toast.dart';

class ArvoreTile extends StatelessWidget {
  ArvoreTile({required this.arvore, this.onTap, required this.store});

  final Arvore arvore;
  final Function? onTap;
  final ArvoreStore store;
  final ToastHelper toastHelper = Modular.get<ToastHelper>();

  final List<MenuChoice> choices = [
    MenuChoice(index: 0, title: 'Editar', iconData: Icons.edit),
    MenuChoice(index: 1, title: 'Excluir', iconData: Icons.delete)
  ];

  @override
  Widget build(BuildContext context) {
    toastHelper.init(context);
    return GestureDetector(
      onTap: onTap == null ? null : () => onTap!(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _getPopUpMenuItem(context),
                  CustomCardList(
                    titulo: 'Identificador',
                    message: '${arvore.numArvore}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'DAP',
                    message: '${arvore.dap} cm',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Altura total',
                    message: '${arvore.alturaTotal} m',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Estado',
                    message: '${arvore.estadoDescription}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Observação',
                    message: '${arvore.observacao}',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          child: Text(
                            'Localização',
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (arvore.latitude.isEmpty ||
                                arvore.longitude.isEmpty) {
                              toastHelper.show(
                                  'Nenhuma latitude e longitude cadastrada.',
                                  gravity: Toast.bottom,
                                  duration: 2);
                              return;
                            } else {
                              MapsLauncher.launchCoordinates(
                                  double.tryParse(arvore.latitude) ?? 0,
                                  double.tryParse(arvore.longitude) ?? 0,
                                  'Localização da árvore');
                            }
                          },
                          icon: const Icon(
                            Icons.map,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editArvore(BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CadastrarArvorePage(
          args: [arvore, null, arvore.projetoId],
        ),
      ),
    );
    if (success != null && success) store.refresh();
  }

  void deleteArvore(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => DialogPlatform(
              title: 'Excluído',
              content: 'Confirmar a exclusão da árvore N° ${arvore.numArvore}?',
              textNoButton: 'Não',
              textYesButton: 'Sim',
              actionNo: () => Navigator.of(context).pop(),
              actionYes: () async {
                store.deleteArvore(arvore.id);
                Navigator.of(context).pop();
              },
            ));
  }

  Widget _getPopUpMenuItem(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PopupMenuButton<MenuChoice>(
          position: PopupMenuPosition.under,
          onSelected: (choice) {
            switch (choice.index) {
              case 0:
                editArvore(context);
                break;
              case 1:
                deleteArvore(context);
                break;
            }
          },
          icon: const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.more_vert,
              size: 20,
              color: ColorsConst.primary,
            ),
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
                          color: ColorsConst.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          choice.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: ColorsConst.primary,
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
    );
  }
}

class MenuChoice {
  MenuChoice(
      {required this.index, required this.title, required this.iconData});

  final int index;
  final String title;
  final IconData iconData;
}
