import 'package:mobx/mobx.dart';
part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
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
  String confirmacaoSenha = "";
  @observable
  bool erroConfirmacaoSenha = false;
  @observable
  String textoErroConfirmacaoSenha = "";

  @action
  bool validarEmail() {
    errorEmail = true;
    if (!email.contains("@") || !email.contains(".com") || email.length <= 3) {
      textoErroEmail = "O email está incorreto";
      return false;
    }
    errorEmail = false;
    textoErroEmail = "";
    return true;
  }

  @action
  bool validarSenha() {
    erroSenha = true;
    if (senha.length < 6) {
      textoErroSenha = "Senha pequena";
      return false;
    }
    if (senha.isEmpty) {
      textoErroSenha = "Senha não pode ficar vazia";
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
  bool validarConfirmacaoSenha() {
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
}
