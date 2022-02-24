import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/widgets/error_box.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/visibilidade.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/visibilidade_store.dart';

class VisibilidadePage extends StatelessWidget {
  final Visibilidade? selected;

  VisibilidadePage({required this.selected});
  final store = Modular.get<VisibilidadeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visibilidades'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Observer(
            builder: (_) {
              if (store.error != null) {
                return ErrorBox(
                  message: store.error,
                );
              } else if (store.visibilidadesList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final visibilidades = store.visibilidadesList;

                return ListView.separated(
                  itemCount: visibilidades.length,
                  separatorBuilder: (_, __) {
                    return const Divider(
                      height: 0.1,
                      color: Colors.grey,
                    );
                  },
                  itemBuilder: (_, index) {
                    final visibilidade = visibilidades[index];

                    return InkWell(
                      onTap: () {
                        Modular.to.pop(visibilidade);
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        color: visibilidade.id == selected?.id
                            ? Colors.purple.withAlpha(50)
                            : null,
                        child: Text(
                          visibilidade.description,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: visibilidade.id == selected?.id
                                ? FontWeight.bold
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
