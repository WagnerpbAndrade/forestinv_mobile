import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_button.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_dropdown_button.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_text_form_field.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/new_project_controller.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/new_projeto_store.dart';

class NewProjectPage extends StatefulWidget {
  @override
  _NewProjectPageState createState() => _NewProjectPageState();
}

class _NewProjectPageState
    extends ModularState<NewProjectPage, NewProjetoStore> {
  final newProjectController = Modular.get<NewProjectController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo projeto"),
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
                      controller: newProjectController.nomeController,
                      label: "Nome do projeto",
                      icon: const Icon(
                        Icons.person,
                        color: ColorsConst.primaryColor,
                      ),
                      validar: (value) {
                        store.name = value.toString();
                        store.textErrorName =
                            store.validarNome(store.name ?? "");
                      },
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
                      controller: newProjectController.areaController,
                      label: "Área do projeto",
                      icon: const Icon(
                        Icons.person,
                        color: ColorsConst.primaryColor,
                      ),
                      validar: (value) {
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
                CustomDropdownButton(
                  hint: 'Selecione',
                  icon: Icons.arrow_drop_down_circle,
                  items: const <String>["PUBLICO", "PRIVADO"],
                  dropdownValue: 'PRIVADO',
                  width: double.infinity,
                ),
                CustomButton(
                  title: "Salvar",
                  action: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
