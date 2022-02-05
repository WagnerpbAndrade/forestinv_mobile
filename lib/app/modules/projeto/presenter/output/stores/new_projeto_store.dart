import 'package:mobx/mobx.dart';
part 'new_projeto_store.g.dart';

class NewProjetoStore = _NewProjetoStoreBase with _$NewProjetoStore;

abstract class _NewProjetoStoreBase with Store {
  @observable
  String? name;
  @observable
  bool errorName = false;
  @observable
  String textErrorName = "";

  @observable
  String? areaProjeto;
  @observable
  bool errorAreaProjeto = false;
  @observable
  String textErrorAreaProjeto = "";

  @action
  String validarNome(String name) {
    if (name.length < 6) {
      errorName = true;
      return "Nome precisa ter no mínimo 6 letras";
    }
    errorName = false;
    return '';
  }

  @action
  String validarAreaProjeto(String area) {
    if (area.isEmpty) {
      errorAreaProjeto = true;
      return "Informe uma área válida";
    }
    area = area.replaceAll(',', '.');
    var areaDouble = 0.0;
    try {
      areaDouble = double.parse(area);
    } catch (e) {
      errorAreaProjeto = true;
      return "Informe uma área válida";
    }
    if (areaDouble <= 0) {
      errorAreaProjeto = true;
      return "Informe uma área válida";
    }
    errorAreaProjeto = false;
    return '';
  }
}
