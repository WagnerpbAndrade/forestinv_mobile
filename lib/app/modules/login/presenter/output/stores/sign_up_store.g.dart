// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStoreBase, Store {
  final _$textoErroEmailAtom = Atom(name: '_SignUpStoreBase.textoErroEmail');

  @override
  String get textoErroEmail {
    _$textoErroEmailAtom.reportRead();
    return super.textoErroEmail;
  }

  @override
  set textoErroEmail(String value) {
    _$textoErroEmailAtom.reportWrite(value, super.textoErroEmail, () {
      super.textoErroEmail = value;
    });
  }

  final _$errorEmailAtom = Atom(name: '_SignUpStoreBase.errorEmail');

  @override
  bool get errorEmail {
    _$errorEmailAtom.reportRead();
    return super.errorEmail;
  }

  @override
  set errorEmail(bool value) {
    _$errorEmailAtom.reportWrite(value, super.errorEmail, () {
      super.errorEmail = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignUpStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$textoErroSenhaAtom = Atom(name: '_SignUpStoreBase.textoErroSenha');

  @override
  String get textoErroSenha {
    _$textoErroSenhaAtom.reportRead();
    return super.textoErroSenha;
  }

  @override
  set textoErroSenha(String value) {
    _$textoErroSenhaAtom.reportWrite(value, super.textoErroSenha, () {
      super.textoErroSenha = value;
    });
  }

  final _$erroSenhaAtom = Atom(name: '_SignUpStoreBase.erroSenha');

  @override
  bool get erroSenha {
    _$erroSenhaAtom.reportRead();
    return super.erroSenha;
  }

  @override
  set erroSenha(bool value) {
    _$erroSenhaAtom.reportWrite(value, super.erroSenha, () {
      super.erroSenha = value;
    });
  }

  final _$senhaAtom = Atom(name: '_SignUpStoreBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$confirmacaoSenhaAtom =
      Atom(name: '_SignUpStoreBase.confirmacaoSenha');

  @override
  String get confirmacaoSenha {
    _$confirmacaoSenhaAtom.reportRead();
    return super.confirmacaoSenha;
  }

  @override
  set confirmacaoSenha(String value) {
    _$confirmacaoSenhaAtom.reportWrite(value, super.confirmacaoSenha, () {
      super.confirmacaoSenha = value;
    });
  }

  final _$erroConfirmacaoSenhaAtom =
      Atom(name: '_SignUpStoreBase.erroConfirmacaoSenha');

  @override
  bool get erroConfirmacaoSenha {
    _$erroConfirmacaoSenhaAtom.reportRead();
    return super.erroConfirmacaoSenha;
  }

  @override
  set erroConfirmacaoSenha(bool value) {
    _$erroConfirmacaoSenhaAtom.reportWrite(value, super.erroConfirmacaoSenha,
        () {
      super.erroConfirmacaoSenha = value;
    });
  }

  final _$textoErroConfirmacaoSenhaAtom =
      Atom(name: '_SignUpStoreBase.textoErroConfirmacaoSenha');

  @override
  String get textoErroConfirmacaoSenha {
    _$textoErroConfirmacaoSenhaAtom.reportRead();
    return super.textoErroConfirmacaoSenha;
  }

  @override
  set textoErroConfirmacaoSenha(String value) {
    _$textoErroConfirmacaoSenhaAtom
        .reportWrite(value, super.textoErroConfirmacaoSenha, () {
      super.textoErroConfirmacaoSenha = value;
    });
  }

  final _$_SignUpStoreBaseActionController =
      ActionController(name: '_SignUpStoreBase');

  @override
  bool validarEmail() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.validarEmail');
    try {
      return super.validarEmail();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarSenha() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.validarSenha');
    try {
      return super.validarSenha();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validarSenhaComCampoConfirmacao() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.validarSenhaComCampoConfirmacao');
    try {
      return super.validarSenhaComCampoConfirmacao();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarConfirmacaoSenha() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.validarConfirmacaoSenha');
    try {
      return super.validarConfirmacaoSenha();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textoErroEmail: ${textoErroEmail},
errorEmail: ${errorEmail},
email: ${email},
textoErroSenha: ${textoErroSenha},
erroSenha: ${erroSenha},
senha: ${senha},
confirmacaoSenha: ${confirmacaoSenha},
erroConfirmacaoSenha: ${erroConfirmacaoSenha},
textoErroConfirmacaoSenha: ${textoErroConfirmacaoSenha}
    ''';
  }
}
