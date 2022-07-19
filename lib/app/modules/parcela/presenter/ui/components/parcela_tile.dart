import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_card_list.dart';
import 'package:forestinv_mobile/app/core/widgets/dialog_platform.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/stores/parcela_store.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/ui/pages/cadastrar_parcela_page.dart';
import 'package:forestinv_mobile/helper/extensions.dart';
import 'package:forestinv_mobile/helper/toast_helper.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:toast/toast.dart';

class ParcelaTile extends StatelessWidget {
  ParcelaTile({required this.parcela, this.onTap, required this.store});

  final Parcela parcela;
  final Function? onTap;
  final ParcelaStore store;
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
                vertical: 8,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _getMenuOptions(context),
                  //_getPopUpMenuItem(context),
                  CustomCardList(
                    titulo: 'Identificador',
                    message: '${parcela.numero}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Número do talhão',
                    message: '${parcela.numTalhao.toString()}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Área',
                    message: '${parcela.area.toString()} m²',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Espaçamento',
                    message: '${parcela.espacamento} m',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Plantio em',
                    message: '${parcela.dataPlantio.formattedDate()}',
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
                            if (parcela.latitude!.isEmpty ||
                                parcela.longitude!.isEmpty) {
                              toastHelper.show(
                                  'Nenhuma latitude e longitude cadastrada.',
                                  gravity: Toast.bottom,
                                  duration: 2);
                              return;
                            } else {
                              MapsLauncher.launchCoordinates(
                                  double.tryParse(parcela.latitude!) ?? 0,
                                  double.tryParse(parcela.longitude!) ?? 0,
                                  'Localização da parcela');
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

  Widget _getMenuOptions(final BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            editParcela(context);
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {
            deleteParcela(context);
          },
          icon: const Icon(Icons.delete_forever),
        ),
      ],
    );
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
                editParcela(context);
                break;
              case 1:
                deleteParcela(context);
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

  Future<void> editParcela(BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CadastrarParcelaPage(
          args: [parcela, null],
        ),
      ),
    );
    if (success != null && success) store.refresh();
  }

  void deleteParcela(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => DialogPlatform(
              title: 'Excluído',
              content: 'Confirmar a exclusão da parcela n° ${parcela.numero}?',
              textNoButton: 'Não',
              textYesButton: 'Sim',
              actionNo: () => Navigator.of(context).pop(),
              actionYes: () async {
                store.deleteParcela(parcela.id);
                Navigator.of(context).pop();
              },
            ));
  }
}

class MenuChoice {
  MenuChoice(
      {required this.index, required this.title, required this.iconData});

  final int index;
  final String title;
  final IconData iconData;
}
