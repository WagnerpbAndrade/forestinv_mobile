// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arvore_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArvoreStore on _ArvoreStoreBase, Store {
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_ArvoreStoreBase.showProgress'))
          .value;

  late final _$errorAtom =
      Atom(name: '_ArvoreStoreBase.error', context: context);

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

  late final _$loadingAtom =
      Atom(name: '_ArvoreStoreBase.loading', context: context);

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

  late final _$deleteArvoreAsyncAction =
      AsyncAction('_ArvoreStoreBase.deleteArvore', context: context);

  @override
  Future<void> deleteArvore(dynamic arvoreId) {
    return _$deleteArvoreAsyncAction.run(() => super.deleteArvore(arvoreId));
  }

  late final _$_ArvoreStoreBaseActionController =
      ActionController(name: '_ArvoreStoreBase', context: context);

  @override
  void addNewArvores(List<Arvore> newArvores) {
    final _$actionInfo = _$_ArvoreStoreBaseActionController.startAction(
        name: '_ArvoreStoreBase.addNewArvores');
    try {
      return super.addNewArvores(newArvores);
    } finally {
      _$_ArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? value) {
    final _$actionInfo = _$_ArvoreStoreBaseActionController.startAction(
        name: '_ArvoreStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_ArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ArvoreStoreBaseActionController.startAction(
        name: '_ArvoreStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
loading: ${loading},
showProgress: ${showProgress}
    ''';
  }
}
