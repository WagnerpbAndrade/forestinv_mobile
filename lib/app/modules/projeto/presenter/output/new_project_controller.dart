import 'package:flutter/material.dart';

class NewProjectController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  NewProjectController() {
    nomeController = TextEditingController();
    areaController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void salvarProjeto() {
    //if (formKey.currentState!.validate()) {}
    final nome = nomeController.text.toString();
  }
}
