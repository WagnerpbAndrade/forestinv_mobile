import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
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
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(16),
              // ),
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
                                message: cadastrarParcelaStore.error,
                              ),
                            );
                          }),
                          const FieldTitle(
                            title: 'Número da parcela',
                            subtitle: 'Informe um número identificador',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue: cadastrarParcelaStore.numero,
                                enabled: !cadastrarParcelaStore.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Exemplo: N° 10',
                                    isDense: true,
                                    errorText:
                                        cadastrarParcelaStore.numeroError),
                                onChanged: cadastrarParcelaStore.setNumero,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLines: 1,
                                maxLength: 7,
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
                                initialValue: cadastrarParcelaStore.area,
                                enabled: !cadastrarParcelaStore.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Exemplo: 100',
                                    suffix: const Text('m²'),
                                    isDense: true,
                                    errorText: cadastrarParcelaStore.areaError),
                                keyboardType: TextInputType.number,
                                onChanged: cadastrarParcelaStore.setArea,
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
                                maxLines: 1,
                                maxLength: 9,
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Número do talhão',
                            subtitle: 'Informe um número identificador',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue:
                                    cadastrarParcelaStore.numeroTalhao,
                                enabled: !cadastrarParcelaStore.loading,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Exemplo: 10',
                                    isDense: true,
                                    errorText: cadastrarParcelaStore
                                        .numeroTalhaoError),
                                keyboardType: TextInputType.number,
                                onChanged:
                                    cadastrarParcelaStore.setNumeroTalhao,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLines: 1,
                                maxLength: 7,
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
                                                      color: Colors.black,
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
                                                      color: Colors.black,
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
                                              ? const CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation(
                                                          Colors.white),
                                                )
                                              : const Text(
                                                  'GPS',
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
                            ],
                          ),
                          Observer(
                            builder: (_) {
                              return CustomElevatedButton(
                                onPressed: editing
                                    ? cadastrarParcelaStore.editarOnPressed
                                    : cadastrarParcelaStore.cadastrarOnPressed,
                                child: cadastrarParcelaStore.loading
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
