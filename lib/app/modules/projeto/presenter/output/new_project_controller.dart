import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/add_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';

class NewProjectController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void salvarProjeto() {
    if (formKey.currentState!.validate()) {
      final usecase = Modular.get<AddProjectUsecase>();
      final projetoStore = Modular.get<ProjetoStore>();
      final nome = nomeController.text.toString();
      final area = double.parse(areaController.text.toString());

      final projectToSave = Project(
        nome: nome,
        area: area,
        visibilidadeProjetoEnum: "PRIVADO",
      );
      usecase.add(projectToSave);
      projetoStore.projectsList.add(projectToSave);
    }
  }
}
