// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_LoginStoreBase.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_LoginStoreBase.passwordValid'))
          .value;
  Computed<Function?>? _$loginOnPressedComputed;

  @override
  Function? get loginOnPressed => (_$loginOnPressedComputed ??=
          Computed<Function?>(() => super.loginOnPressed,
              name: '_LoginStoreBase.loginOnPressed'))
      .value;
  Computed<Function?>? _$googleOnPressedComputed;

  @override
  Function? get googleOnPressed => (_$googleOnPressedComputed ??=
          Computed<Function?>(() => super.googleOnPressed,
              name: '_LoginStoreBase.googleOnPressed'))
      .value;

  late final _$emailAtom =
      Atom(name: '_LoginStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginStoreBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LoginStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_LoginStoreBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadingGoogleAtom =
      Atom(name: '_LoginStoreBase.loadingGoogle', context: context);

  @override
  bool get loadingGoogle {
    _$loadingGoogleAtom.reportRead();
    return super.loadingGoogle;
  }

  @override
  set loadingGoogle(bool value) {
    _$loadingGoogleAtom.reportWrite(value, super.loadingGoogle, () {
      super.loadingGoogle = value;
    });
  }

  late final _$_loginAsyncAction =
      AsyncAction('_LoginStoreBase._login', context: context);

  @override
  Future<void> _login() {
    return _$_loginAsyncAction.run(() => super._login());
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
loading: ${loading},
error: ${error},
loadingGoogle: ${loadingGoogle},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
loginOnPressed: ${loginOnPressed},
googleOnPressed: ${googleOnPressed}
    ''';
  }
}
