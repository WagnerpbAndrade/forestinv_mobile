import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_card_list.dart';
import 'package:forestinv_mobile/app/core/widgets/dialog_platform.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/home_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/pages/cadastrar_projeto_page.dart';
import 'package:forestinv_mobile/app/screens/offline/offline_screen.dart';
import 'package:forestinv_mobile/app/stores/connectivity_store.dart';
import 'package:forestinv_mobile/helper/extensions.dart';

class ProjetoTile extends StatelessWidget {
  const ProjetoTile(
      {required this.projeto, this.onTap, required this.homeStore});

  final Project projeto;
  final Function? onTap;
  final HomeStore homeStore;

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //_getPopUpMenu(context),
                  CustomCardList(
                    titulo: 'Nome do projeto',
                    message: '${projeto.nome}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Área',
                    message: '${projeto.area.toString()} ha',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardList(
                    titulo: 'Criado em',
                    message: '${projeto.dataCriacao!.formattedDate()}',
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

  Widget _getMenuOptions(final BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            editProject(context);
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {
            deleteProject(context);
          },
          icon: const Icon(Icons.delete_forever),
        ),
        IconButton(
          onPressed: () {
            exportarProject(context, projeto.id);
          },
          icon: const Icon(Icons.share),
        ),
        // IconButton(
        //   onPressed: () {
        //     sentToBluetooth(context);
        //   },
        //   icon: const Icon(Icons.bluetooth),
        // ),
      ],
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

  Future<void> sentToBluetooth(final BuildContext context) async {
    homeStore.goToBluetoothModule();
  }
}
