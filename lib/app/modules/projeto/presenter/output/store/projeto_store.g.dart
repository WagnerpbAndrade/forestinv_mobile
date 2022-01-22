// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projeto_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjetoStore on _ProjetoStoreBase, Store {
  final _$searchAtom = Atom(name: '_ProjetoStoreBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$errorAtom = Atom(name: '_ProjetoStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProjetoStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_ProjetoStoreBaseActionController =
      ActionController(name: '_ProjetoStoreBase');

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_ProjetoStoreBaseActionController.startAction(
        name: '_ProjetoStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_ProjetoStoreBaseActionController.startAction(
        name: '_ProjetoStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ProjetoStoreBaseActionController.startAction(
        name: '_ProjetoStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
error: ${error},
isLoading: ${isLoading}
    ''';
  }
}
