import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/save_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/update_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/new_projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/projeto_store.dart';
import 'package:mobx/mobx.dart';

class NewProjectController {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final store = Modular.get<NewProjetoStore>();

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
  Future<ApiResponse> salvarProjeto() async {
    if (formKey.currentState!.validate()) {
      final usecase = Modular.get<SaveProjectUsecase>();
      final auth = Modular.get<AuthStore>();
      final nome = nomeController.text.toString();
      final area = double.parse(areaController.text.toString());

      final projectToSave = Project(
        uuid: auth.getUser().uid,
        nome: nome,
        area: area,
        visibilidadeProjetoEnum: "PRIVADO",
      );
      return usecase.save(projectToSave);
    }
    return ApiResponse.error(message: 'Preencha todos os campos');
  }

  @action
  void atualizarProjeto(Project project) async {
    if (formKey.currentState!.validate()) {
      final projetoStore = Modular.get<ProjetoStore>();
      final usecase = Modular.get<UpdateProjectUsecase>();
      final nome = nomeController.text.toString();
      final area = double.parse(areaController.text.toString());

      final projectToUpdate = Project(
        id: project.id,
        uuid: project.uuid,
        nome: nome,
        area: area,
        dataCriacao: project.dataCriacao,
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

  @action
  validarNome(String name) {
    if (name.length < 6) {
      store.errorName = true;
      return "Nome precisa ter no mínimo 6 letras";
    }
    store.errorName = false;
  }

  @action
  validarAreaProjeto(String area) {
    if (area.isEmpty) {
      store.errorAreaProjeto = true;
      return "Informe uma área válida";
    }
    area = area.replaceAll(',', '.');
    var areaDouble = 0.0;
    try {
      areaDouble = double.parse(area);
    } catch (e) {
      store.errorAreaProjeto = true;
      return "Informe uma área válida";
    }
    if (areaDouble <= 0) {
      store.errorAreaProjeto = true;
      return "Informe uma área válida";
    }
    store.errorAreaProjeto = false;
  }
}
