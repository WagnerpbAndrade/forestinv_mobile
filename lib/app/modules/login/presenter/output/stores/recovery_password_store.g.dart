// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecoveryPasswordStore on _RecoveryPasswordStoreBase, Store {
  final _$textoErroEmailAtom =
      Atom(name: '_RecoveryPasswordStoreBase.textoErroEmail');

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

  final _$errorEmailAtom = Atom(name: '_RecoveryPasswordStoreBase.errorEmail');

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

  final _$emailAtom = Atom(name: '_RecoveryPasswordStoreBase.email');

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

  final _$_RecoveryPasswordStoreBaseActionController =
      ActionController(name: '_RecoveryPasswordStoreBase');

  @override
  dynamic validarEmail() {
    final _$actionInfo = _$_RecoveryPasswordStoreBaseActionController
        .startAction(name: '_RecoveryPasswordStoreBase.validarEmail');
    try {
      return super.validarEmail();
    } finally {
      _$_RecoveryPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textoErroEmail: ${textoErroEmail},
errorEmail: ${errorEmail},
email: ${email}
    ''';
  }
}
