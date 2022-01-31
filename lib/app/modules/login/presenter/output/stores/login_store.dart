import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  bool botaoLoading = false;

  @observable
  String textoErroEmail = "";
  @observable
  bool errorEmail = false;
  @observable
  String email = "";

  @observable
  String textoErroSenha = "";
  @observable
  bool erroSenha = false;
  @observable
  String senha = "";

  @observable
  String nome = "";
  @observable
  bool erroNome = false;
  @observable
  String textoErroNome = "";

  @observable
  String confirmacaoSenha = "";
  @observable
  bool erroConfirmacaoSenha = false;
  @observable
  String textoErroConfirmacaoSenha = "";

  @observable
  bool temErroFirebase = false;
  @observable
  String textoErroFirebase = "";

  @action
  validarNome() {
    if (nome.length < 4) {
      textoErroNome = "Nome pequeno";
      return false;
    }
    textoErroNome = "";
    return true;
  }

  @action
  validarEmail() {
    temErroFirebase = false;
    textoErroFirebase = "";
    errorEmail = true;
    if (!email.contains("@") || !email.contains(".com") || email.length <= 3) {
      textoErroEmail = "Usuário/senha inválido(a)";
      return false;
    }
    errorEmail = false;
    textoErroEmail = "";
    return true;
  }

  @action
  validarSenha() {
    erroSenha = true;
    if (senha.length < 6) {
      textoErroSenha = "Usuário/senha inválido(a)";
      return false;
    }
    if (senha.isEmpty) {
      textoErroSenha = "Informe uma senha";
      return false;
    }
    erroSenha = false;
    textoErroSenha = "";
    return true;
  }

  @action
  void validarSenhaComCampoConfirmacao() {
    validarSenha();
    validarConfirmacaoSenha();
  }

  @action
  validarConfirmacaoSenha() {
    erroConfirmacaoSenha = true;
    if (senha != confirmacaoSenha) {
      textoErroConfirmacaoSenha = "Senhas não conferem";
      return false;
    }
    if (erroSenha) {
      textoErroConfirmacaoSenha = "Senha pequena";
      return false;
    }
    if (senha == "") {
      textoErroConfirmacaoSenha = "Senha vazia";
      return false;
    }
    erroConfirmacaoSenha = false;
    textoErroConfirmacaoSenha = "";
    return true;
  }

  @action
  retornoErroFirebaseLogin(String erro) {
    switch (erro) {
      case "Usuário não encontrado":
        textoErroFirebase = "Usuário não encontrado";
        temErroFirebase = true;
        break;
      case "Email ou senha incorretos":
        textoErroFirebase = "Email ou senha incorretos";
        temErroFirebase = true;
        break;
      case "Email informado já está cadastrado":
        textoErroFirebase = "Email ou senha incorretos";
        temErroFirebase = true;
        break;
      case "Email inválido":
        textoErroFirebase = "Email inválido";
        temErroFirebase = true;
        break;
      default:
        temErroFirebase = false;
        textoErroEmail = "";
        break;
    }
  }
}
