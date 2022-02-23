import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_button.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_text_form_field.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/controllers/new_project_controller.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/new_projeto_store.dart';
import 'package:form_field_validator/form_field_validator.dart';

class NewProjectPage extends StatefulWidget {
  final Project? project;

  const NewProjectPage({this.project});

  @override
  _NewProjectPageState createState() => _NewProjectPageState();
}

class _NewProjectPageState
    extends ModularState<NewProjectPage, NewProjetoStore> {
  final newProjectController = Modular.get<NewProjectController>();

  @override
  void initState() {
    super.initState();

    if (widget.project == null) {
      newProjectController.areaController.clear();
      newProjectController.nomeController.clear();
    } else {
      newProjectController.nomeController.text = widget.project!.nome;
      newProjectController.areaController.text =
          widget.project!.area.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.project == null
            ? const Text(
                "NOVO PROJETO",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              )
            : const Text(
                "ATUALIZAR PROJETO",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: newProjectController.formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  validator: (nome) => newProjectController.validarNome(nome),
                  controller: newProjectController.nomeController,
                  label: "Nome do projeto",
                  onChanged: MultiValidator([
                    RequiredValidator(errorText: 'Informe o nome do projeto'),
                    MinLengthValidator(3,
                        errorText: 'Informe um nome com no mínimo 3 letras')
                  ]),
                  textError: store.textErrorName,
                  valido: store.errorName,
                  isPassWord: false,
                  textType: TextInputType.name,
                ),
                CustomTextFormField(
                  validator: (area) =>
                      newProjectController.validarAreaProjeto(area),
                  controller: newProjectController.areaController,
                  label: "Área do projeto",
                  onChanged: (value) {
                    store.areaProjeto = value.toString();
                    store.textErrorAreaProjeto = newProjectController
                        .validarAreaProjeto(store.areaProjeto ?? '');
                  },
                  textError: store.textErrorAreaProjeto,
                  valido: store.errorAreaProjeto,
                  isPassWord: false,
                  textType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                ),
                // CustomDropdownButton(
                //   hint: 'Selecione',
                //   icon: Icons.arrow_drop_down_circle,
                //   items: const <String>["PUBLICO", "PRIVADO"],
                //   dropdownValue: 'PRIVADO',
                //   width: double.infinity,
                // ),
                CustomButton(
                  title: widget.project == null ? "Salvar" : 'Confirmar',
                  action: () async {
                    if (widget.project == null) {
                      final response =
                          await newProjectController.salvarProjeto();

                      if (response.ok) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Projeto cadastrado com sucesso.',
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
                      final response = await newProjectController
                          .atualizarProjeto(widget.project!);

                      if (response.ok) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Projeto atualizado com sucesso.',
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
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
