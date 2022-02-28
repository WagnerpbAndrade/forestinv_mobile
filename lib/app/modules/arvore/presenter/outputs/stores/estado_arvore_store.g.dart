// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado_arvore_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstadoArvoreStore on _EstadoArvoreStoreBase, Store {
  final _$errorAtom = Atom(name: '_EstadoArvoreStoreBase.error');

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

  final _$_EstadoArvoreStoreBaseActionController =
      ActionController(name: '_EstadoArvoreStoreBase');

  @override
  void setEstadoArvore(List<EstadoArvore> estados) {
    final _$actionInfo = _$_EstadoArvoreStoreBaseActionController.startAction(
        name: '_EstadoArvoreStoreBase.setEstadoArvore');
    try {
      return super.setEstadoArvore(estados);
    } finally {
      _$_EstadoArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_EstadoArvoreStoreBaseActionController.startAction(
        name: '_EstadoArvoreStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_EstadoArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error}
    ''';
  }
}
