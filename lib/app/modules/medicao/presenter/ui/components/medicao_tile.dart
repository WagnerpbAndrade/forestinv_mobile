import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_alert_dialog.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_card_list.dart';
import 'package:forestinv_mobile/app/core/widgets/dialog_platform.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/stores/medicao_store.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/ui/pages/cadastrar_medicao_page.dart';
import 'package:forestinv_mobile/helper/extensions.dart';

class MedicaoTile extends StatelessWidget {
  const MedicaoTile({required this.medicao, this.onTap, required this.store});

  final Medicao medicao;
  final Function? onTap;
  final MedicaoStore store;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? null : () => onTap!(),
      child: Container(
        padding: const EdgeInsets.only(top: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          clipBehavior: Clip.antiAlias,
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
                  //_getPopUpMenuItem(context),
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
                    titulo: 'Próxima medição',
                    message: '${medicao.getProximaMedicao().formattedDate()}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _getMenuOptions(context),
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
      builder: (_) => CustomAlertDialog(
        title: 'Excluir',
        content:
            'Confirmar a exclusão da medição ano ${medicao.dataMedicao!.year}?',
        textNoButton: 'Cancelar',
        textYesButton: 'Sim',
        actionNo: () => Navigator.of(context).pop(),
        actionYes: () async {
          store.deleteMedicao(medicao.id);
          Navigator.of(context).pop();
        },
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
            editMedicao(context);
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {
            deleteMedicao(context);
          },
          icon: const Icon(Icons.delete_forever),
        ),
      ],
    );
  }
}
