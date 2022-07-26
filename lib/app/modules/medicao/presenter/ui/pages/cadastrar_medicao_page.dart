import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_elevated_button.dart';
import 'package:forestinv_mobile/app/core/widgets/error_box.dart';
import 'package:forestinv_mobile/app/core/widgets/field_title.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/stores/cadastrar_medicao_store.dart';
import 'package:forestinv_mobile/helper/extensions.dart';
import 'package:mobx/mobx.dart';

class CadastrarMedicaoPage extends StatefulWidget {
  final List? args;

  const CadastrarMedicaoPage({this.args});

  @override
  _CadastrarMedicaoPageState createState() => _CadastrarMedicaoPageState(args);
}

class _CadastrarMedicaoPageState extends State<CadastrarMedicaoPage> {
  _CadastrarMedicaoPageState(List? args)
      : editing = args?[0] != null,
        cadastrarMedicaoStore = CadastrarMedicaoStore(args);

  final CadastrarMedicaoStore cadastrarMedicaoStore;

  bool editing;

  @override
  void initState() {
    super.initState();

    when((_) => cadastrarMedicaoStore.updatedMedicao, () {
      if (editing) {
        Navigator.of(context).pop(true);
      } else {
        Modular.to.pop();
      }
    });

    when((_) => cadastrarMedicaoStore.savedMedicao, () {
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
        title: Text(editing ? 'Editar Medição' : 'Cadastro'),
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
                  if (cadastrarMedicaoStore.loading) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Text(
                            'Salvando Medição',
                            style: TextStyle(
                              fontSize: 18,
                            ),
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
                                message: cadastrarMedicaoStore.error,
                              ),
                            );
                          }),
                          const FieldTitle(
                            title: 'Identificador da medição',
                            subtitle:
                                'Informe um identificador de sua preferência.',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue:
                                    cadastrarMedicaoStore.identificador,
                                enabled: !cadastrarMedicaoStore.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    isDense: true,
                                    errorText: cadastrarMedicaoStore
                                        .identificadorError),
                                onChanged:
                                    cadastrarMedicaoStore.setIdentificador,
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                maxLength: 35,
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Descrição',
                            subtitle: 'Informe uma descrição para a medição',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue: cadastrarMedicaoStore.descricao,
                                enabled: !cadastrarMedicaoStore.loading,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText:
                                      cadastrarMedicaoStore.descricaoError,
                                ),
                                onChanged: cadastrarMedicaoStore.setDescricao,
                                keyboardType: TextInputType.name,
                                maxLines: 1,
                                maxLength: 100,
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Nome do responsável',
                            subtitle:
                                'Informe o nome do responsável pela medição',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue:
                                    cadastrarMedicaoStore.nomeResponsavel,
                                enabled: !cadastrarMedicaoStore.loading,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: cadastrarMedicaoStore
                                      .nomeResponsavelError,
                                ),
                                onChanged:
                                    cadastrarMedicaoStore.setNomeResponsavel,
                                keyboardType: TextInputType.name,
                                maxLines: 1,
                                maxLength: 100,
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Data da medição',
                            subtitle: 'Informe a data inicial da medição',
                          ),
                          GestureDetector(
                            onTap: () async =>
                                cadastrarMedicaoStore.openDatePicker(context),
                            child: Observer(
                              builder: (_) {
                                return TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    label: Text(
                                      cadastrarMedicaoStore.selectedDate!
                                          .formattedDate(),
                                    ),
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.datetime,
                                );
                              },
                            ),
                          ),
                          Observer(
                            builder: (_) {
                              return CustomElevatedButton(
                                onPressed: editing
                                    ? cadastrarMedicaoStore.editarOnPressed
                                    : cadastrarMedicaoStore.cadastrarOnPressed,
                                child: cadastrarMedicaoStore.loading
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
