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
  String toString() {
    return '''
search: ${search}
    ''';
  }
}
