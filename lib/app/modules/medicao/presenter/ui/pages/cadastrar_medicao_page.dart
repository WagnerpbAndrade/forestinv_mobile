import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                                message: cadastrarMedicaoStore.error,
                              ),
                            );
                          }),
                          const FieldTitle(
                            title: 'Número da medição',
                            subtitle: 'Informe um número identificador',
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              initialValue: cadastrarMedicaoStore.numero,
                              enabled: !cadastrarMedicaoStore.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Exemplo: N° 10',
                                  isDense: true,
                                  errorText: cadastrarMedicaoStore.numeroError),
                              onChanged: cadastrarMedicaoStore.setNumero,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              maxLines: 1,
                              maxLength: 7,
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          const FieldTitle(
                            title: 'Nome do responsável',
                            subtitle:
                                'Informe o nome do responsável pela medição',
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              initialValue:
                                  cadastrarMedicaoStore.nomeResponsavel,
                              enabled: !cadastrarMedicaoStore.loading,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                isDense: true,
                                errorText:
                                    cadastrarMedicaoStore.nomeResponsavelError,
                              ),
                              onChanged:
                                  cadastrarMedicaoStore.setNomeResponsavel,
                              keyboardType: TextInputType.name,
                              maxLines: 1,
                              maxLength: 100,
                            );
                          }),
                          const SizedBox(
                            height: 16,
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
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.datetime,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Observer(
                            builder: (_) {
                              return CustomElevatedButton(
                                onPressed: editing
                                    ? cadastrarMedicaoStore.editarOnPressed
                                    : cadastrarMedicaoStore.cadastrarOnPressed,
                                child: cadastrarMedicaoStore.loading
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
