import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_card_list.dart';
import 'package:forestinv_mobile/app/core/widgets/dialog_platform.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/stores/medicao_store.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/ui/pages/cadastrar_medicao_page.dart';
import 'package:forestinv_mobile/helper/extensions.dart';

class MedicaoTile extends StatelessWidget {
  MedicaoTile({required this.medicao, this.onTap, required this.store});

  final Medicao medicao;
  final Function? onTap;
  final MedicaoStore store;

  final List<MenuChoice> choices = [
    MenuChoice(index: 0, title: 'Editar', iconData: Icons.edit),
    MenuChoice(index: 1, title: 'Excluir', iconData: Icons.delete)
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? null : () => onTap!(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _getPopUpMenuItem(context),
                  CustomCardList(
                    titulo: 'Identificador',
                    message: '${medicao.identificador}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Descrição',
                    message: '${medicao.descricao}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Data da medição',
                    message: '${medicao.dataMedicao!.formattedDate()}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Responsável',
                    message: '${medicao.nomeResponsavel}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Próxima medição a partir de',
                    message: '${medicao.getProximaMedicao().formattedDate()}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editMedicao(final BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CadastrarMedicaoPage(
          args: [medicao, null],
        ),
      ),
    );
    if (success != null && success) store.refresh();
  }

  void deleteMedicao(final BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => DialogPlatform(
        title: 'Excluído',
        content:
            'Confirmar a exclusão da medição ano ${medicao.dataMedicao!.year}?',
        textNoButton: 'Não',
        textYesButton: 'Sim',
        actionNo: () => Navigator.of(context).pop(),
        actionYes: () async {
          store.deleteMedicao(medicao.id);
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _getPopUpMenuItem(final BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PopupMenuButton<MenuChoice>(
          position: PopupMenuPosition.under,
          onSelected: (choice) {
            switch (choice.index) {
              case 0:
                editMedicao(context);
                break;
              case 1:
                deleteMedicao(context);
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
