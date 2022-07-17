import 'package:flutter/material.dart';
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
        height: MediaQuery.of(context).size.height * 0.35,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          PopupMenuButton<MenuChoice>(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Identificador',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${medicao.identificador}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Descrição',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${medicao.descricao}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Data da medição',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${medicao.dataMedicao!.formattedDate()}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Responsável',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${medicao.nomeResponsavel}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Próxima medição a partir de',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${medicao.getProximaMedicao().formattedDate()}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editMedicao(BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CadastrarMedicaoPage(
          args: [medicao, null],
        ),
      ),
    );
    if (success != null && success) store.refresh();
  }

  void deleteMedicao(BuildContext context) {
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
