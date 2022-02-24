import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_elevated_button.dart';
import 'package:forestinv_mobile/app/core/widgets/error_box.dart';
import 'package:forestinv_mobile/app/core/widgets/field_title.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/cadastrar_projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/components/visibilidade_field.dart';

class CadastrarProjetoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cadastrarProjetoStore = Modular.get<CadastrarProjetoStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ErrorBox(
                          message: cadastrarProjetoStore.error,
                        ),
                      );
                    }),
                    const FieldTitle(
                      title: 'Nome do projeto',
                      subtitle: 'Escolha um nome representativo',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !cadastrarProjetoStore.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Exemplo: Fazenda Esperança - MG',
                            isDense: true,
                            errorText: cadastrarProjetoStore.nomeError),
                        onChanged: cadastrarProjetoStore.setNome,
                        maxLines: 1,
                        maxLength: 100,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    const FieldTitle(
                      title: 'Área do projeto',
                      subtitle: 'Área total do projeto em hectares',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !cadastrarProjetoStore.loading,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'Exemplo: 100 ha',
                              isDense: true,
                              errorText: cadastrarProjetoStore.areaError),
                          keyboardType: TextInputType.number,
                          onChanged: cadastrarProjetoStore.setArea,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLines: 1,
                          maxLength: 7,
                        );
                      },
                    ),
                    VisibilidadeField(cadastrarProjetoStore),
                    Observer(
                      builder: (_) {
                        return CustomElevatedButton(
                          onPressed: cadastrarProjetoStore.cadastrarOnPressed,
                          child: cadastrarProjetoStore.loading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text(
                                  'CADASTRAR',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
