import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_button.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_text_form_field.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/controllers/create_arvore_controller.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/create_arvore_story.dart';

class CreateArvorePage extends StatefulWidget {
  final List args;

  const CreateArvorePage(this.args);

  @override
  _CreateArvorePageState createState() => _CreateArvorePageState();
}

class _CreateArvorePageState
    extends ModularState<CreateArvorePage, CreateArvoreStore> {
  final createArvoreController = Modular.get<CreateArvoreController>();
  Arvore? get arvore => widget.args.elementAt(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: arvore == null
            ? const Text(
                'Cadastrar Árvore',
                style: TextStyle(
                  color: ColorsConst.textColorPrimary,
                  fontWeight: FontWeight.w400,
                ),
              )
            : const Text('Editar Árvore'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Observer(
                          builder: (context) {
                            return CustomTextFormField(
                              controller: createArvoreController
                                  .txtNumeroArvoreController,
                              label: "Número da árvore",
                              icon: const Icon(
                                Icons.email,
                                color: ColorsConst.primary,
                              ),
                              onChanged: (value) {
                                store.numeroArvore = value.toString();

                                store.validarNumeroArvore();
                              },
                              textError: store.textErrorNumeroArvore,
                              valido: store.numeroArvoreError,
                              isPassWord: false,
                              textType: TextInputType.number,
                            );
                          },
                        ),
                        Observer(
                          builder: (context) {
                            return CustomTextFormField(
                              controller:
                                  createArvoreController.txtDapController,
                              label: "DAP da árvore",
                              icon: const Icon(
                                Icons.email,
                                color: ColorsConst.primary,
                              ),
                              onChanged: (value) {
                                store.dap = value.toString();

                                store.validarDap();
                              },
                              textError: store.textErrorDap,
                              valido: store.dapError,
                              isPassWord: false,
                              textType: const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                            );
                          },
                        ),
                        Observer(
                          builder: (context) {
                            return CustomTextFormField(
                              controller: createArvoreController
                                  .txtAlturaTotalController,
                              label: "Altura da árvore",
                              icon: const Icon(
                                Icons.email,
                                color: ColorsConst.primary,
                              ),
                              onChanged: (value) {
                                store.altura = value.toString();

                                store.validarAltura();
                              },
                              textError: store.textErrorAltura,
                              valido: store.alturaError,
                              isPassWord: false,
                              textType: TextInputType.number,
                            );
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        //Estado da árvore
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextFormField(
                          controller:
                              createArvoreController.txtObservacaoController,
                          label: "Observação",
                          icon: const Icon(
                            Icons.email,
                            color: ColorsConst.primary,
                          ),
                          onChanged: (value) {},
                          textError: store.textErrorObservacao,
                          valido: store.observacaoError,
                          isPassWord: false,
                          textType: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
            child: CustomButton(
              action: () async {
                print('Entrou no botão');
                if (store.isValidFields()) {
                  print('Entrou no if isValidFields');
                  if (arvore == null) {
                    print('Entrou no if medicao == null');
                    final response = await createArvoreController
                        .save(widget.args.elementAt(1));
                    if (response.ok) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Árvore cadastrada com sucesso.',
                            style: TextStyle(
                              color: ColorsConst.textColorPrimary,
                            ),
                          ),
                          backgroundColor: ColorsConst.primary,
                          action: SnackBarAction(
                            textColor: ColorsConst.textColorPrimary,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                      Modular.to.pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            response.message ?? '',
                            style: const TextStyle(
                              color: ColorsConst.textColorPrimary,
                            ),
                          ),
                          backgroundColor: ColorsConst.primary,
                          action: SnackBarAction(
                            textColor: ColorsConst.textColorPrimary,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                    }
                  } else {
                    final response = await createArvoreController.update(
                        arvore!.id.toString(), widget.args.elementAt(1));
                    if (response.ok) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Árvore atualizada com sucesso.',
                            style: TextStyle(
                              color: ColorsConst.textColorPrimary,
                            ),
                          ),
                          backgroundColor: ColorsConst.primary,
                          action: SnackBarAction(
                            textColor: ColorsConst.textColorPrimary,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                      Modular.to.pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            response.message ?? '',
                            style: const TextStyle(
                              color: ColorsConst.textColorPrimary,
                            ),
                          ),
                          backgroundColor: ColorsConst.primary,
                          action: SnackBarAction(
                            textColor: ColorsConst.textColorPrimary,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                    }
                  }
                } else {
                  print('Campos não validados');
                }
              },
              title: arvore == null ? "Salvar" : 'Atualizar',
              margin: const EdgeInsets.only(top: 5),
            ),
          ),
        ],
      ),
    );
  }
}
