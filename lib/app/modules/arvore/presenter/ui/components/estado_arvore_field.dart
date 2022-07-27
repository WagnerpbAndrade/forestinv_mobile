import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/cadastrar_arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/components/estado_arvore_page.dart';

class EstadoArvoreField extends StatelessWidget {
  const EstadoArvoreField(this.cadastrarArvoreStore);

  final CadastrarArvoreStore cadastrarArvoreStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          ListTile(
            title: cadastrarArvoreStore.estadoArvore == null
                ? const Text(
                    'Estado da Árvore *',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  )
                : const Text(
                    'Estado da Árvore *',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
            subtitle: cadastrarArvoreStore.estadoArvore == null
                ? null
                : Text(
                    '${cadastrarArvoreStore.estadoArvore!.description}',
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                  ),
            trailing: const Icon(Icons.keyboard_arrow_down),
            onTap: () async {
              final estadoArvore = await showDialog(
                context: context,
                builder: (_) => EstadoArvorePage(
                  selected: cadastrarArvoreStore.estadoArvore,
                ),
              );
              if (estadoArvore != null) {
                cadastrarArvoreStore.setEstadoArvore(estadoArvore);
              }
            },
          ),
          if (cadastrarArvoreStore.estadoArvoreError != null)
            Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.red)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              child: Text(
                cadastrarArvoreStore.estadoArvoreError!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            )
          else
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[500]!),
                ),
              ),
            )
        ],
      );
    });
  }
}
