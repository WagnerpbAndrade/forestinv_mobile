import 'package:mobx/mobx.dart';
part 'create_medicao_store.g.dart';

class CreateMedicaoStore = _CreateMedicaoStoreBase with _$CreateMedicaoStore;

abstract class _CreateMedicaoStoreBase with Store {
  @observable
  String textErrorNumeroArvore = "";
  @observable
  bool numeroArvoreError = false;
  @observable
  String numeroArvore = "";

  @observable
  String textErrorResponsavel = "";
  @observable
  bool responsavelError = false;
  @observable
  String responsavel = "";

  @observable
  String textErrorDap = "";
  @observable
  bool dapError = false;
  @observable
  String dap = "";

  @observable
  String textErrorAltura = "";
  @observable
  bool alturaError = false;
  @observable
  String altura = "";

  @observable
  String textErrorObservacao = "";
  @observable
  bool observacaoError = false;
  @observable
  String observacao = "";

  @observable
  String textErrorLatitude = "";
  @observable
  bool latitudeError = false;
  @observable
  String latitude = "";

  @observable
  String textErrorLongitude = "";
  @observable
  bool longitudeError = false;
  @observable
  String longitude = "";

  @action
  bool validarNumeroArvore() {
    numeroArvoreError = true;
    if (numeroArvore.isEmpty) {
      textErrorNumeroArvore = "Informe o número da árvore";
      return false;
    }

    numeroArvoreError = true;
    var numeroParse = 0;
    try {
      numeroParse = int.parse(numeroArvore);
    } catch (e) {
      textErrorNumeroArvore = "Informe um número válido";
      return false;
    }
    numeroArvoreError = true;
    if (numeroParse <= 0) {
      textErrorNumeroArvore = "Informe um número válido";
      return false;
    }
    numeroArvoreError = false;
    textErrorNumeroArvore = '';
    return true;
  }

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

  @action
  bool validarDap() {
    dapError = true;
    if (dap.isEmpty) {
      textErrorDap = "Informe o DAP da árvore";
      return false;
    }

    dapError = true;
    var dapParse = 0.0;
    dap = dap.replaceAll(',', '.');
    try {
      dapParse = double.parse(dap);
    } catch (e) {
      textErrorDap = "Informe um DAP válido";
      return false;
    }
    dapError = true;
    if (dapParse <= 0) {
      textErrorDap = "Informe um DAP válido";
      return false;
    }
    dapError = false;
    textErrorDap = '';
    return true;
  }

  @action
  bool validarAltura() {
    alturaError = true;
    if (altura.isEmpty) {
      textErrorAltura = "Informe a altura da árvore";
      return false;
    }

    alturaError = true;
    var alturaParse = 0.0;
    altura = altura.replaceAll(',', '.');
    try {
      alturaParse = double.parse(altura);
    } catch (e) {
      textErrorAltura = "Informe uma altura válida";
      return false;
    }
    alturaError = true;
    if (alturaParse <= 0) {
      textErrorAltura = "Informe uma altura válida";
      return false;
    }
    alturaError = false;
    textErrorAltura = '';
    return true;
  }

  bool isValidFields() {
    return validarNumeroArvore() &&
        validarResponsavel() &&
        validarDap() &&
        validarAltura();
  }
}
