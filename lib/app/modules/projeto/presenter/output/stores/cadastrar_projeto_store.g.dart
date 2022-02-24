// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_projeto_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastrarProjetoStore on _CadastrarProjetoStoreBase, Store {
  Computed<bool>? _$nomeIsValidComputed;

  @override
  bool get nomeIsValid =>
      (_$nomeIsValidComputed ??= Computed<bool>(() => super.nomeIsValid,
              name: '_CadastrarProjetoStoreBase.nomeIsValid'))
          .value;
  Computed<bool>? _$areaIsValidComputed;

  @override
  bool get areaIsValid =>
      (_$areaIsValidComputed ??= Computed<bool>(() => super.areaIsValid,
              name: '_CadastrarProjetoStoreBase.areaIsValid'))
          .value;
  Computed<bool>? _$visibilidadeValidComputed;

  @override
  bool get visibilidadeValid => (_$visibilidadeValidComputed ??= Computed<bool>(
          () => super.visibilidadeValid,
          name: '_CadastrarProjetoStoreBase.visibilidadeValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CadastrarProjetoStoreBase.isFormValid'))
          .value;
  Computed<Function?>? _$cadastrarOnPressedComputed;

  @override
  Function? get cadastrarOnPressed => (_$cadastrarOnPressedComputed ??=
          Computed<Function?>(() => super.cadastrarOnPressed,
              name: '_CadastrarProjetoStoreBase.cadastrarOnPressed'))
      .value;

  final _$nomeAtom = Atom(name: '_CadastrarProjetoStoreBase.nome');

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$areaAtom = Atom(name: '_CadastrarProjetoStoreBase.area');

  @override
  String? get area {
    _$areaAtom.reportRead();
    return super.area;
  }

  @override
  set area(String? value) {
    _$areaAtom.reportWrite(value, super.area, () {
      super.area = value;
    });
  }

  final _$visibilidadeAtom =
      Atom(name: '_CadastrarProjetoStoreBase.visibilidade');

  @override
  Visibilidade? get visibilidade {
    _$visibilidadeAtom.reportRead();
    return super.visibilidade;
  }

  @override
  set visibilidade(Visibilidade? value) {
    _$visibilidadeAtom.reportWrite(value, super.visibilidade, () {
      super.visibilidade = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CadastrarProjetoStoreBase.loading');

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

  final _$errorAtom = Atom(name: '_CadastrarProjetoStoreBase.error');

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

  final _$_cadastrarAsyncAction =
      AsyncAction('_CadastrarProjetoStoreBase._cadastrar');

  @override
  Future<void> _cadastrar() {
    return _$_cadastrarAsyncAction.run(() => super._cadastrar());
  }

  final _$_CadastrarProjetoStoreBaseActionController =
      ActionController(name: '_CadastrarProjetoStoreBase');

  @override
  void setNome(String value) {
    final _$actionInfo = _$_CadastrarProjetoStoreBaseActionController
        .startAction(name: '_CadastrarProjetoStoreBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_CadastrarProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArea(String value) {
    final _$actionInfo = _$_CadastrarProjetoStoreBaseActionController
        .startAction(name: '_CadastrarProjetoStoreBase.setArea');
    try {
      return super.setArea(value);
    } finally {
      _$_CadastrarProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisibilidade(Visibilidade value) {
    final _$actionInfo = _$_CadastrarProjetoStoreBaseActionController
        .startAction(name: '_CadastrarProjetoStoreBase.setVisibilidade');
    try {
      return super.setVisibilidade(value);
    } finally {
      _$_CadastrarProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
area: ${area},
visibilidade: ${visibilidade},
loading: ${loading},
error: ${error},
nomeIsValid: ${nomeIsValid},
areaIsValid: ${areaIsValid},
visibilidadeValid: ${visibilidadeValid},
isFormValid: ${isFormValid},
cadastrarOnPressed: ${cadastrarOnPressed}
    ''';
  }
}
