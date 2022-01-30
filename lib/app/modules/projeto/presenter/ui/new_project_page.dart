import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/constants/custom_theme.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_button.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_text_form_field.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/new_project_controller.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/new_projeto_store.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NewProjectPage extends StatefulWidget {
  @override
  _NewProjectPageState createState() => _NewProjectPageState();
}

class _NewProjectPageState
    extends ModularState<NewProjectPage, NewProjetoStore> {
  final newProjectController = Modular.get<NewProjectController>();

  @override
  void initState() {
    super.initState();

    newProjectController.areaController.clear();
    newProjectController.nomeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NOVO PROJETO",
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    return CustomTextFormField(
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Informe o nome do projeto'),
                        MinLengthValidator(3,
                            errorText: 'Informe um nome com no mínimo 3 letras')
                      ]),
                      controller: newProjectController.nomeController,
                      label: "Nome do projeto",
                      icon: const Icon(
                        Icons.person,
                        color: ColorsConst.primary,
                      ),
                      onChanged: MultiValidator([
                        RequiredValidator(
                            errorText: 'Informe o nome do projeto'),
                        MinLengthValidator(3,
                            errorText: 'Informe um nome com no mínimo 3 letras')
                      ]),
                      textError: store.textErrorName,
                      valido: store.errorName,
                      isPassWord: false,
                      textType: TextInputType.name,
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return CustomTextFormField(
                      validator: RequiredValidator(
                          errorText: 'Informe a área do projeto'),
                      controller: newProjectController.areaController,
                      label: "Área do projeto",
                      icon: const Icon(
                        Icons.person,
                        color: ColorsConst.primary,
                      ),
                      onChanged: (value) {
                        store.areaProjeto = value.toString();
                        store.textErrorAreaProjeto =
                            store.validarAreaProjeto(store.areaProjeto ?? '');
                      },
                      textError: store.textErrorAreaProjeto,
                      valido: store.errorAreaProjeto,
                      isPassWord: false,
                      textType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: false,
                      ),
                    );
                  },
                ),
                // CustomDropdownButton(
                //   hint: 'Selecione',
                //   icon: Icons.arrow_drop_down_circle,
                //   items: const <String>["PUBLICO", "PRIVADO"],
                //   dropdownValue: 'PRIVADO',
                //   width: double.infinity,
                // ),
                CustomButton(
                  title: "Salvar",
                  action: () {
                    newProjectController.salvarProjeto();

                    if (newProjectController.formKey.currentState!.validate()) {
                      if (newProjectController.error) {
                        Alert(
                          type: AlertType.error,
                          buttons: [
                            DialogButton(
                              child: const Text('Ok'),
                              onPressed: () {
                                Modular.to.pop();
                              },
                            )
                          ],
                          context: context,
                          title: "Erro",
                          desc: newProjectController.errorMessage,
                        ).show();
                      } else {
                        Modular.to.pop();
                        return Alert(
                          type: AlertType.success,
                          style: AlertStyle(
                            animationType: AnimationType.fromBottom,
                            isCloseButton: false,
                            isOverlayTapDismiss: false,
                            descStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            descTextAlign: TextAlign.start,
                            animationDuration:
                                const Duration(milliseconds: 600),
                            alertBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            titleStyle: const TextStyle(
                              color: Colors.red,
                            ),
                            alertAlignment: Alignment.topCenter,
                          ),
                          buttons: [
                            DialogButton(
                              color: ColorsConst.secondary,
                              child: const Text(
                                'Ok',
                                style: TextStyle(
                                  color: ColorsConst.textColorPrimary,
                                ),
                              ),
                              onPressed: () {
                                Modular.to.pop();
                              },
                            )
                          ],
                          context: context,
                          title: "Tudo certo",
                          desc: 'Projeto criado com sucesso',
                        ).show();
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
