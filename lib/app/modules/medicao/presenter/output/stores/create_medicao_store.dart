import 'package:mobx/mobx.dart';
part 'create_medicao_store.g.dart';

class CreateMedicaoStore = _CreateMedicaoStoreBase with _$CreateMedicaoStore;

abstract class _CreateMedicaoStoreBase with Store {
  @observable
  String textErrorResponsavel = "";
  @observable
  bool responsavelError = false;
  @observable
  String responsavel = "";

  @action
  bool validarResponsavel() {
    responsavelError = true;
    if (responsavel.isEmpty) {
      textErrorResponsavel = "Informe o nome do responsável pela medição";
      return false;
    }
    responsavelError = false;
    textErrorResponsavel = '';
    return true;
  }

  bool isValidFields() {
    return validarResponsavel();
  }
}
