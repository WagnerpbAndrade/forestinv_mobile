import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_elevated_button.dart';
import 'package:forestinv_mobile/app/core/widgets/error_box.dart';
import 'package:forestinv_mobile/app/core/widgets/field_title.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/cadastrar_projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/components/visibilidade_field.dart';
import 'package:mobx/mobx.dart';

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
  void initState() {
    super.initState();

    when((_) => cadastrarProjetoStore.updatedProject, () {
      if (editing) {
        Navigator.of(context).pop(true);
      } else {
        Modular.to.pop();
      }
    });

    when((_) => cadastrarProjetoStore.savedProject, () {
      if (!editing) {
        Navigator.of(context).pop(true);
      } else {
        Modular.to.pop();
      }
    });
  }

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
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(16),
              // ),
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
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CircularProgressIndicator()
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
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue: cadastrarProjetoStore.nome,
                                enabled: !cadastrarProjetoStore.loading,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Exemplo: Fazenda Esperança - MG',
                                  isDense: true,
                                  errorText: cadastrarProjetoStore.nomeError,
                                ),
                                onChanged: cadastrarProjetoStore.setNome,
                                maxLines: 1,
                                maxLength: 100,
                              );
                            },
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
                                  isDense: true,
                                  errorText: cadastrarProjetoStore.areaError,
                                  suffixText: 'ha',
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: cadastrarProjetoStore.setArea,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  TextInputMask(
                                    mask: '9+999.99',
                                    //placeholder: '0',
                                    maxPlaceHolders: 3,
                                    reverse: true,
                                  ),
                                ],
                                maxLines: 1,
                                maxLength: 9,
                                textAlign: TextAlign.right,
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
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        editing ? 'EDITAR' : 'CADASTRAR',
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
