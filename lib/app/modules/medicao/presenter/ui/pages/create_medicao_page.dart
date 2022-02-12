import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_button.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_text_form_field.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/controllers/create_medicao_controller.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/stores/create_medicao_store.dart';

class CreateMedicaoPage extends StatefulWidget {
  final List args;

  const CreateMedicaoPage(this.args);

  @override
  _CreateMedicaoPageState createState() => _CreateMedicaoPageState();
}

class _CreateMedicaoPageState
    extends ModularState<CreateMedicaoPage, CreateMedicaoStore> {
  final createMedicaoController = Modular.get<CreateMedicaoController>();
  Medicao? get medicao => widget.args.elementAt(0);

  @override
  void initState() {
    super.initState();
    createMedicaoController.configPage(medicao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: medicao == null
            ? const Text(
                'Cadastrar Medição',
                style: TextStyle(
                  color: ColorsConst.textColorPrimary,
                  fontWeight: FontWeight.w400,
                ),
              )
            : const Text('Editar Medição'),
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
                              controller: createMedicaoController
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
                              controller: createMedicaoController
                                  .txtNomeResponsavelController,
                              label: "Nome do responśavel",
                              icon: const Icon(
                                Icons.email,
                                color: ColorsConst.primary,
                              ),
                              onChanged: (value) {
                                store.responsavel = value.toString();

                                store.validarResponsavel();
                              },
                              textError: store.textErrorResponsavel,
                              valido: store.responsavelError,
                              isPassWord: false,
                              textType: TextInputType.text,
                            );
                          },
                        ),
                        Observer(
                          builder: (context) {
                            return CustomTextFormField(
                              controller:
                                  createMedicaoController.txtDapController,
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
                              controller: createMedicaoController
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
                              createMedicaoController.txtObservacaoController,
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
                  if (medicao == null) {
                    print('Entrou no if medicao == null');
                    final response = await createMedicaoController
                        .save(widget.args.elementAt(1));
                    if (response.ok) {
                      final medicao = response.result as Medicao;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Medição da árvore ${medicao.numArvore} cadastrada com sucesso.',
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
                    final response = await createMedicaoController.update(
                        medicao!.id.toString(), widget.args.elementAt(1));
                    if (response.ok) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Medição atualizada com sucesso.',
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
              title: medicao == null ? "Salvar" : 'Atualizar',
              margin: const EdgeInsets.only(top: 5),
            ),
          ),
        ],
      ),
    );
  }
}
