import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_alert_dialog.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_card_list.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/pages/cadastrar_arvore_page.dart';
import 'package:forestinv_mobile/app/stores/settings_store.dart';
import 'package:forestinv_mobile/helper/toast_helper.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:toast/toast.dart';

class ArvoreTile extends StatelessWidget {
  ArvoreTile({required this.arvore, this.onTap, required this.store});

  final Arvore arvore;
  final Function? onTap;
  final ArvoreStore store;
  final ToastHelper toastHelper = Modular.get<ToastHelper>();

  @override
  Widget build(BuildContext context) {
    toastHelper.init(context);
    final settingsStore = Modular.get<SettingsStore>();
    return GestureDetector(
      onTap: () {
        editArvore(context);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24.0),
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          clipBehavior: Clip.antiAlias,
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
                  //_getPopUpMenuItem(context),
                  CustomCardList(
                    titulo: 'Identificador',
                    message: '${arvore.identificadorArvore}',
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
                    message: arvore.observacao.isNotEmpty
                        ? '${arvore.observacao}'
                        : 'N/A',
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
                        SizedBox(
                          child: Text(
                            'Localização',
                            style: TextStyle(fontSize: settingsStore.fontSize),
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
                  _getMenuOptions(context),
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
        builder: (_) => CustomAlertDialog(
              title: 'Excluir',
              content:
                  'Confirmar a exclusão da árvore ${arvore.identificadorArvore}?',
              textNoButton: 'Cancelar',
              textYesButton: 'Sim',
              actionNo: () => Navigator.of(context).pop(),
              actionYes: () async {
                store.deleteArvore(arvore.id);
                Navigator.of(context).pop();
              },
            ));
  }

  Widget _getMenuOptions(final BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            editArvore(context);
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {
            deleteArvore(context);
          },
          icon: const Icon(Icons.delete_forever),
        ),
      ],
    );
  }
}
