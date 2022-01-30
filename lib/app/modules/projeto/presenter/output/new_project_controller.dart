import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/save_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/update_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';
import 'package:mobx/mobx.dart';

class NewProjectController {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  String errorMessage = '';

  @action
  void setErrorMessage(String value) => errorMessage = value;

  @observable
  bool error = false;

  @action
  void setError(bool value) => error = value;

  @action
  void salvarProjeto() async {
    if (formKey.currentState!.validate()) {
      final projetoStore = Modular.get<ProjetoStore>();
      final usecase = Modular.get<SaveProjectUsecase>();
      final nome = nomeController.text.toString();
      final area = double.parse(areaController.text.toString());

      final projectToSave = Project(
        nome: nome,
        area: area,
        visibilidadeProjetoEnum: "PRIVADO",
      );
      final resultEither = await usecase.save(projectToSave);
      resultEither.fold(
        (failureResult) {
          setError(true);
          setErrorMessage(failureResult.errorMessage);
        },
        (project) {
          setError(false);
          projetoStore.projectsList.add(projectToSave);
        },
      );
    } else {
      print("Entrou no else do Salvar");
    }
  }

  @action
  void atualizarProjeto(int? projectId) async {
    if (formKey.currentState!.validate()) {
      final projetoStore = Modular.get<ProjetoStore>();
      final usecase = Modular.get<UpdateProjectUsecase>();
      final nome = nomeController.text.toString();
      final area = double.parse(areaController.text.toString());

      final projectToUpdate = Project(
        id: projectId,
        nome: nome,
        area: area,
        visibilidadeProjetoEnum: "PRIVADO",
      );
      final resultEither = await usecase.update(projectToUpdate);
      resultEither.fold(
        (failureResult) {
          setError(true);
          setErrorMessage(failureResult.errorMessage);
        },
        (project) {
          setError(false);
          projetoStore.projectsList.clear();
        },
      );
    } else {
      print("Entrou no else do Salvar");
    }
  }
}
