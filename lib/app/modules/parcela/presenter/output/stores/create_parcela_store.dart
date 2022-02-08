import 'package:mobx/mobx.dart';
part 'create_parcela_store.g.dart';

class CreateParcelaStore = _CreateParcelaStoreBase with _$CreateParcelaStore;

abstract class _CreateParcelaStoreBase with Store {
  @observable
  String textErrorNumero = "";
  @observable
  bool numeroError = false;
  @observable
  String numero = "";

  @observable
  String textErrorArea = "";
  @observable
  bool areaError = false;
  @observable
  String area = "";

  @observable
  String textErrorLargura = "";
  @observable
  bool larguraError = false;
  @observable
  String largura = "";

  @observable
  String textErrorNumTalhao = "";
  @observable
  bool numTalhaoError = false;
  @observable
  String numTalhao = "";

  @observable
  String textErrorEspacamento = "";
  @observable
  bool espacamentoError = false;
  @observable
  String espacamento = "";

  @action
  bool validarNumeroParcela() {
    numeroError = true;
    if (numero.isEmpty) {
      textErrorNumero = "Informe o número da parcela";
      return false;
    }

    numeroError = true;
    var numeroParse = 0;
    try {
      numeroParse = int.parse(numero);
    } catch (e) {
      textErrorNumero = "Informe um número válido";
      return false;
    }
    numeroError = true;
    if (numeroParse <= 0) {
      textErrorNumero = "Informe um número válido";
      return false;
    }
    numeroError = false;
    textErrorNumero = '';
    return true;
  }

  @action
  bool validarAreaParcela() {
    areaError = true;
    if (area.isEmpty) {
      textErrorArea = "Informe a área da parcela";
      return false;
    }

    areaError = true;
    var areaParse = 0.0;
    area = area.replaceAll(',', '.');
    try {
      areaParse = double.parse(area);
    } catch (e) {
      textErrorArea = "Informe uma área válida";
      return false;
    }
    areaError = true;
    if (areaParse <= 0) {
      textErrorArea = "Informe uma área válida";
      return false;
    }
    areaError = false;
    textErrorArea = '';
    return true;
  }

  @action
  bool validarLarguraParcela() {
    larguraError = true;
    if (largura.isEmpty) {
      textErrorLargura = "Informe a largura da parcela";
      return false;
    }

    larguraError = true;
    var larguraParse = 0.0;
    largura = largura.replaceAll(',', '.');
    try {
      larguraParse = double.parse(largura);
    } catch (e) {
      textErrorLargura = "Informe uma largura válida";
      return false;
    }
    larguraError = true;
    if (larguraParse <= 0) {
      textErrorLargura = "Informe uma largura válida";
      return false;
    }
    larguraError = false;
    textErrorLargura = '';
    return true;
  }

  @action
  bool validarNumTalhaoParcela() {
    numTalhaoError = true;
    if (numTalhao.isEmpty) {
      textErrorNumTalhao = "Informe o número do talhão da parcela";
      return false;
    }

    numTalhaoError = true;
    var numTalhaoParse = 0;
    try {
      numTalhaoParse = int.parse(numTalhao);
    } catch (e) {
      textErrorNumTalhao = "Informe um número do talhão válido";
      return false;
    }
    numTalhaoError = true;
    if (numTalhaoParse <= 0) {
      textErrorNumTalhao = "Informe um número do talhão válido";
      return false;
    }
    numTalhaoError = false;
    textErrorNumTalhao = '';
    return true;
  }

  @action
  bool validarEspacamentoParcela() {
    espacamentoError = true;
    if (espacamento.isEmpty) {
      textErrorEspacamento = "Informe o espaçamento da parcela";
      return false;
    }
    espacamentoError = false;
    textErrorEspacamento = '';
    return true;
  }
}
