import 'package:camera_camera/camera_camera.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_elevated_button.dart';
import 'package:forestinv_mobile/app/core/widgets/error_box.dart';
import 'package:forestinv_mobile/app/core/widgets/field_title.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/cadastrar_arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/components/estado_arvore_field.dart';
import 'package:mobx/mobx.dart';

class CadastrarArvorePage extends StatefulWidget {
  final List? args;

  const CadastrarArvorePage({this.args});

  @override
  _CadastrarArvorePageState createState() => _CadastrarArvorePageState(args);
}

class _CadastrarArvorePageState extends State<CadastrarArvorePage> {
  _CadastrarArvorePageState(List? args)
      : editing = args?[0] != null,
        cadastrarArvoreStore = CadastrarArvoreStore(args: args);

  final CadastrarArvoreStore cadastrarArvoreStore;

  bool editing;

  @override
  void initState() {
    super.initState();

    when((_) => cadastrarArvoreStore.updatedArvore, () {
      if (editing) {
        Navigator.of(context).pop(true);
      } else {
        Modular.to.pop();
      }
    });

    when((_) => cadastrarArvoreStore.savedArvore, () {
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
        title: Text(editing ? 'Editar Árvore' : 'Cadastro'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.pushNamed(
                  '${RouterConst.PROJECT_ROUTER}${RouterConst.ARVORE_ROUTER}/arvore_infos');
            },
            icon: const Icon(Icons.info_outline_rounded),
          ),
          IconButton(
            onPressed: () {
              Modular.to.pushNamed(
                  '${RouterConst.PROJECT_ROUTER}${RouterConst.ARVORE_ROUTER}/estados');
            },
            icon: const Icon(Icons.help_outline_rounded),
          )
        ],
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
                  if (cadastrarArvoreStore.loading) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Text(
                            'Salvando Árvore',
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
                          Observer(
                            builder: (_) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ErrorBox(
                                  message: cadastrarArvoreStore.error,
                                ),
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Identificador da árvore',
                            subtitle: 'Informe um identificador',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue:
                                    cadastrarArvoreStore.identificadorArvore,
                                // ignore: avoid_bool_literals_in_conditional_expressions
                                enabled: editing
                                    ? false
                                    : !cadastrarArvoreStore.loading,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Exemplo:  A10',
                                  isDense: true,
                                  errorText: cadastrarArvoreStore
                                      .identificadorArvoreError,
                                ),
                                onChanged:
                                    cadastrarArvoreStore.setIdentificadorArvore,
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                maxLines: 1,
                                maxLength: 50,
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'DAP',
                            subtitle: 'Informe o DAP em centímetros',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue: cadastrarArvoreStore.dapText,
                                enabled: !cadastrarArvoreStore.loading,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Exemplo: 100',
                                  suffix: const Text('cm'),
                                  isDense: true,
                                  errorText: cadastrarArvoreStore.dapError,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                onChanged: cadastrarArvoreStore.setDapText,
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
                                maxLength: 6,
                              );
                            },
                          ),
                          const FieldTitle(
                            title: 'Altura total',
                            subtitle: 'Informe a altura total em metros',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue: cadastrarArvoreStore.alturaText,
                                enabled: !cadastrarArvoreStore.loading,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Exemplo: 100',
                                  suffix: const Text('m'),
                                  isDense: true,
                                  errorText: cadastrarArvoreStore.alturaError,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                onChanged: cadastrarArvoreStore.setAlturaText,
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
                                maxLength: 5,
                              );
                            },
                          ),
                          EstadoArvoreField(cadastrarArvoreStore),
                          const SizedBox(
                            height: 8,
                          ),
                          const FieldTitle(
                            title: 'Observação',
                            subtitle:
                                'Informe se houver alguma observação sobre a árvore',
                          ),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                initialValue: cadastrarArvoreStore.observacao,
                                enabled: !cadastrarArvoreStore.loading,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText:
                                      'Exemplo: Árvore possui cortes em seu tronco',
                                  isDense: true,
                                ),
                                keyboardType: TextInputType.text,
                                onChanged: cadastrarArvoreStore.setObservacao,
                                maxLength: 200,
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const FieldTitle(title: 'Latitude'),
                                  Observer(
                                    builder: (_) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.27,
                                        child: TextFormField(
                                          enabled: false,
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            isDense: true,
                                            label: Text(
                                              cadastrarArvoreStore.latitude,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          keyboardType: TextInputType.text,
                                          onChanged:
                                              cadastrarArvoreStore.setLatitude,
                                          maxLines: 1,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const FieldTitle(title: 'Longitude'),
                                  Observer(
                                    builder: (_) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.27,
                                        child: TextFormField(
                                          enabled: false,
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            isDense: true,
                                            label: Text(
                                              cadastrarArvoreStore.longitude,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          keyboardType: TextInputType.text,
                                          onChanged:
                                              cadastrarArvoreStore.setLongitude,
                                          maxLines: 1,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Observer(
                                builder: (_) {
                                  return CustomElevatedButton(
                                    onPressed: cadastrarArvoreStore.getLatLong,
                                    child: cadastrarArvoreStore.loadingLatLong
                                        ? const CircularProgressIndicator()
                                        : const Text(
                                            'GPS',
                                          ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () => openCamera(),
                            icon: const Icon(Icons.camera_alt),
                            label: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text('Registrar foto da árvore'),
                            ),
                          ),
                          // ExpandableNotifier(
                          //   // <-- Provides ExpandableController to its children
                          //   child: Column(
                          //     children: [
                          //       Expandable(
                          //         // <-- Driven by ExpandableController from ExpandableNotifier
                          //         collapsed: ExpandableButton(
                          //           // <-- Expands when tapped on the cover photo
                          //           child: Text('exapanded'),
                          //         ),
                          //         expanded: Column(children: [
                          //           const Text('audhufahushufahusf'),
                          //           const Text('2fawefawdf'),
                          //           ExpandableButton(
                          //             // <-- Collapses when tapped on
                          //             child: Text("Back"),
                          //           ),
                          //         ]),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Observer(
                            builder: (_) {
                              return CustomElevatedButton(
                                onPressed: editing
                                    ? cadastrarArvoreStore.editarOnPressed
                                    : cadastrarArvoreStore.cadastrarOnPressed,
                                child: cadastrarArvoreStore.loading
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

  void openCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraCamera(
          onFile: (file) => cadastrarArvoreStore.showPreview(file),
        ),
      ),
    );
  }
}
