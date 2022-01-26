import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/exceptions/failure.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/save_project_usecase.dart';
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
  Option<Failure> failure = none();

  @action
  void setFailure(Option<Failure> value) => failure = value;

  @action
  void salvarProjeto() async {
    if (formKey.currentState!.validate()) {
      setLoading(true);
      setFailure(none());

      final projetoStore = Modular.get<ProjetoStore>();
      final usecase = Modular.get<AddProjectUsecase>();
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
          setFailure(optionOf(failureResult));
          setLoading(false);
          print('Entrou no left');
        },
        (_) {
          setLoading(false);
          projetoStore.projectsList.add(projectToSave);
          //Modular.to.pop();
          print('Entrou no right');
        },
      );
    }
  }
}
