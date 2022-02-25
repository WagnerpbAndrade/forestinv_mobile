import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_elevated_button.dart';
import 'package:forestinv_mobile/app/core/widgets/error_box.dart';
import 'package:forestinv_mobile/app/core/widgets/field_title.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/cadastrar_projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/components/visibilidade_field.dart';

class CadastrarProjetoPage extends StatefulWidget {
  final Project? projeto;

  const CadastrarProjetoPage({this.projeto});

  @override
  State<CadastrarProjetoPage> createState() =>
      _CadastrarProjetoPageState(projeto);
}

class _CadastrarProjetoPageState extends State<CadastrarProjetoPage> {
  _CadastrarProjetoPageState(Project? projeto)
      : editing = projeto != null,
        cadastrarProjetoStore = CadastrarProjetoStore(projeto);

  final CadastrarProjetoStore cadastrarProjetoStore;

  bool editing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editing ? 'Editar Projeto' : 'Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Observer(
                builder: (_) {
                  if (cadastrarProjetoStore.loading) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Text(
                            'Salvando Projeto',
                            style:
                                TextStyle(fontSize: 18, color: Colors.purple),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.purple),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Observer(builder: (_) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                            return TextFormField(
                              initialValue: cadastrarProjetoStore.nome,
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
                              return TextFormField(
                                initialValue: cadastrarProjetoStore.area,
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
                                onPressed: editing
                                    ? cadastrarProjetoStore.editarOnPressed
                                    : cadastrarProjetoStore.cadastrarOnPressed,
                                child: cadastrarProjetoStore.loading
                                    ? const CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                      )
                                    : Text(
                                        editing ? 'EDITAR' : 'CADASTRAR',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
