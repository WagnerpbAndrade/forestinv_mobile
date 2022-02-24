import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/cadastrar_projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/pages/visibilidade_page.dart';

class VisibilidadeField extends StatelessWidget {
  const VisibilidadeField(this.cadastrarProjetoStore);

  final CadastrarProjetoStore cadastrarProjetoStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          ListTile(
            title: cadastrarProjetoStore.visibilidade == null
                ? const Text(
                    'Visibilidade *',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  )
                : const Text(
                    'Visibilidade *',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
            subtitle: cadastrarProjetoStore.visibilidade == null
                ? null
                : Text(
                    '${cadastrarProjetoStore.visibilidade!.description}',
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                  ),
            trailing: const Icon(Icons.keyboard_arrow_down),
            onTap: () async {
              final visibilidade = await showDialog(
                context: context,
                builder: (_) => VisibilidadePage(
                  selected: cadastrarProjetoStore.visibilidade,
                ),
              );
              if (visibilidade != null) {
                cadastrarProjetoStore.setVisibilidade(visibilidade);
              }
            },
          ),
          if (cadastrarProjetoStore.visibilidadeError != null)
            Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.red)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              child: Text(
                cadastrarProjetoStore.visibilidadeError!,
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
