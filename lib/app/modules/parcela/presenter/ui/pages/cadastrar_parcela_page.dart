import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_elevated_button.dart';
import 'package:forestinv_mobile/app/core/widgets/error_box.dart';
import 'package:forestinv_mobile/app/core/widgets/field_title.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/stores/cadastrar_parcela_store.dart';
import 'package:forestinv_mobile/helper/extensions.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

class CadastrarParcelaPage extends StatefulWidget {
  final List? args;

  const CadastrarParcelaPage({this.args});

  @override
  State<CadastrarParcelaPage> createState() => _CadastrarParcelaPageState(args);
}

class _CadastrarParcelaPageState extends State<CadastrarParcelaPage> {
  _CadastrarParcelaPageState(List? args)
      : editing = args?[0] != null,
        cadastrarParcelaStore = CadastrarParcelaStore(args: args);

  final CadastrarParcelaStore cadastrarParcelaStore;

  bool editing;

  @override
  void initState() {
    super.initState();

    when((_) => cadastrarParcelaStore.updatedParcela, () {
      if (editing) {
        Navigator.of(context).pop(true);
      } else {
        Modular.to.pop();
      }
    });

    when((_) => cadastrarParcelaStore.savedParcela, () {
      if (!editing) {
        Navigator.of(context).pop(true);
      } else {
        Modular.to.pop();
      }
    });
  }

  final maskFormatter = MaskTextInputFormatter(
    mask: '#x#',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editing ? 'Editar Parcela' : 'Cadastro'),
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
              elevation: 8,
              child: Observer(
                builder: (_) {
                  if (cadastrarParcelaStore.loading) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Text(
                            'Salvando Parcela',
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
                                message: cadastrarParcelaStore.error,
                              ),
                            );
                          }),
                          const FieldTitle(
                            title: 'Identificador do talhão',
                            subtitle: 'Informe um identificador',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue:
                                    cadastrarParcelaStore.identificadorTalhao,
                                enabled: !cadastrarParcelaStore.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Exemplo: T01',
                                    isDense: true,
                                    errorText: cadastrarParcelaStore
                                        .identificadorTalhaoError),
                                onChanged: cadastrarParcelaStore
                                    .setIdentificadorTalhao,
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                maxLength: 50,
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Área do talhão',
                            subtitle: 'Área total talhão em m²',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue: cadastrarParcelaStore.areaTalhao,
                                enabled: !cadastrarParcelaStore.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Exemplo: 100',
                                    suffix: const Text('m²'),
                                    isDense: true,
                                    errorText:
                                        cadastrarParcelaStore.areaTalhaoError),
                                keyboardType: TextInputType.number,
                                onChanged: cadastrarParcelaStore.setAreaTalhao,
                                textAlign: TextAlign.right,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  TextInputMask(
                                    mask: '9+999.99',
                                    //placeholder: '0',
                                    maxPlaceHolders: 3,
                                    reverse: true,
                                  ),
                                ],
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                maxLength: 9,
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Identificador da parcela',
                            subtitle: 'Informe um identificador',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue:
                                    cadastrarParcelaStore.identificadorParcela,
                                enabled: !cadastrarParcelaStore.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Exemplo: P01',
                                    isDense: true,
                                    errorText: cadastrarParcelaStore
                                        .identificadorParcelaError),
                                onChanged: cadastrarParcelaStore
                                    .setIdentificadorParcela,
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                maxLength: 50,
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Área da parcela',
                            subtitle: 'Área total da parcela em m²',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue: cadastrarParcelaStore.areaParcela,
                                enabled: !cadastrarParcelaStore.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Exemplo: 100',
                                    suffix: const Text('m²'),
                                    isDense: true,
                                    errorText:
                                        cadastrarParcelaStore.areaParcelaError),
                                keyboardType: TextInputType.number,
                                onChanged: cadastrarParcelaStore.setAreaParcela,
                                textAlign: TextAlign.right,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  TextInputMask(
                                    mask: '9+999.99',
                                    //placeholder: '0',
                                    maxPlaceHolders: 3,
                                    reverse: true,
                                  ),
                                ],
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                maxLength: 9,
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Espaçamento',
                            subtitle: 'Informe o espaçamento entre as árvores',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue: cadastrarParcelaStore.espacamento,
                                enabled: !cadastrarParcelaStore.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Exemplo: 2x2',
                                    isDense: true,
                                    errorText:
                                        cadastrarParcelaStore.espacamentoError),
                                keyboardType: TextInputType.number,
                                onChanged: cadastrarParcelaStore.setEspacamento,
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                inputFormatters: [
                                  maskFormatter,
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const FieldTitle(
                            title: 'Data do plantio',
                            subtitle: 'Informe a data inicial do plantio',
                          ),
                          GestureDetector(
                            onTap: () async =>
                                cadastrarParcelaStore.openDatePicker(context),
                            child: Observer(
                              builder: (_) {
                                return TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    label: Text(
                                      cadastrarParcelaStore.selectedDate!
                                          .formattedDate(),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      children: [
                                        const FieldTitle(title: 'Latitude'),
                                        Observer(
                                          builder: (_) {
                                            return Container(
                                              height: 40,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.27,
                                              child: TextFormField(
                                                enabled: false,
                                                decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  isDense: true,
                                                  label: Text(
                                                    cadastrarParcelaStore
                                                        .latitude,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: cadastrarParcelaStore
                                                    .setLatitude,
                                                maxLines: 1,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    Column(
                                      children: [
                                        const FieldTitle(title: 'Longitude'),
                                        Observer(
                                          builder: (_) {
                                            return Container(
                                              height: 40,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.27,
                                              child: TextFormField(
                                                enabled: false,
                                                decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  isDense: true,
                                                  label: Text(
                                                    cadastrarParcelaStore
                                                        .longitude,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: cadastrarParcelaStore
                                                    .setLongitude,
                                                maxLines: 1,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    Observer(
                                      builder: (_) {
                                        return CustomElevatedButton(
                                          onPressed:
                                              cadastrarParcelaStore.getLatLong,
                                          child: cadastrarParcelaStore
                                                  .loadingLatLong
                                              ? const CircularProgressIndicator()
                                              : const Text(
                                                  'GPS',
                                                ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Observer(
                            builder: (_) {
                              return CustomElevatedButton(
                                onPressed: editing
                                    ? cadastrarParcelaStore.editarOnPressed
                                    : cadastrarParcelaStore.cadastrarOnPressed,
                                child: cadastrarParcelaStore.loading
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
