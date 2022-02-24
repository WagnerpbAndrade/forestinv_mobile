// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visibilidade_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VisibilidadeStore on _VisibilidadeStoreBase, Store {
  final _$errorAtom = Atom(name: '_VisibilidadeStoreBase.error');

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

  final _$_VisibilidadeStoreBaseActionController =
      ActionController(name: '_VisibilidadeStoreBase');

  @override
  void setVisibilidades(List<Visibilidade> visibilidades) {
    final _$actionInfo = _$_VisibilidadeStoreBaseActionController.startAction(
        name: '_VisibilidadeStoreBase.setVisibilidades');
    try {
      return super.setVisibilidades(visibilidades);
    } finally {
      _$_VisibilidadeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_VisibilidadeStoreBaseActionController.startAction(
        name: '_VisibilidadeStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_VisibilidadeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error}
    ''';
  }
}
