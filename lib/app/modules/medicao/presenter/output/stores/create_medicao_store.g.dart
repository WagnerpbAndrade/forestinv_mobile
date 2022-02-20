// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_medicao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateMedicaoStore on _CreateMedicaoStoreBase, Store {
  final _$textErrorResponsavelAtom =
      Atom(name: '_CreateMedicaoStoreBase.textErrorResponsavel');

  @override
  String get textErrorResponsavel {
    _$textErrorResponsavelAtom.reportRead();
    return super.textErrorResponsavel;
  }

  @override
  set textErrorResponsavel(String value) {
    _$textErrorResponsavelAtom.reportWrite(value, super.textErrorResponsavel,
        () {
      super.textErrorResponsavel = value;
    });
  }

  final _$responsavelErrorAtom =
      Atom(name: '_CreateMedicaoStoreBase.responsavelError');

  @override
  bool get responsavelError {
    _$responsavelErrorAtom.reportRead();
    return super.responsavelError;
  }

  @override
  set responsavelError(bool value) {
    _$responsavelErrorAtom.reportWrite(value, super.responsavelError, () {
      super.responsavelError = value;
    });
  }

  final _$responsavelAtom = Atom(name: '_CreateMedicaoStoreBase.responsavel');

  @override
  String get responsavel {
    _$responsavelAtom.reportRead();
    return super.responsavel;
  }

  @override
  set responsavel(String value) {
    _$responsavelAtom.reportWrite(value, super.responsavel, () {
      super.responsavel = value;
    });
  }

  final _$_CreateMedicaoStoreBaseActionController =
      ActionController(name: '_CreateMedicaoStoreBase');

  @override
  bool validarResponsavel() {
    final _$actionInfo = _$_CreateMedicaoStoreBaseActionController.startAction(
        name: '_CreateMedicaoStoreBase.validarResponsavel');
    try {
      return super.validarResponsavel();
    } finally {
      _$_CreateMedicaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textErrorResponsavel: ${textErrorResponsavel},
responsavelError: ${responsavelError},
responsavel: ${responsavel}
    ''';
  }
}
