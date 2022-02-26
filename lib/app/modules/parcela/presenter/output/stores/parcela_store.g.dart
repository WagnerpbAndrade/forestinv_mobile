// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcela_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ParcelaStore on _ParcelaStoreBase, Store {
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_ParcelaStoreBase.showProgress'))
          .value;

  final _$errorAtom = Atom(name: '_ParcelaStoreBase.error');

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

  final _$loadingAtom = Atom(name: '_ParcelaStoreBase.loading');

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

  final _$deleteParcelaAsyncAction =
      AsyncAction('_ParcelaStoreBase.deleteParcela');

  @override
  Future<void> deleteParcela(dynamic parcelaId) {
    return _$deleteParcelaAsyncAction.run(() => super.deleteParcela(parcelaId));
  }

  final _$_ParcelaStoreBaseActionController =
      ActionController(name: '_ParcelaStoreBase');

  @override
  void addNewParcelas(List<Parcela> newParcelas) {
    final _$actionInfo = _$_ParcelaStoreBaseActionController.startAction(
        name: '_ParcelaStoreBase.addNewParcelas');
    try {
      return super.addNewParcelas(newParcelas);
    } finally {
      _$_ParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? value) {
    final _$actionInfo = _$_ParcelaStoreBaseActionController.startAction(
        name: '_ParcelaStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_ParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ParcelaStoreBaseActionController.startAction(
        name: '_ParcelaStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ParcelaStoreBaseActionController.endAction(_$actionInfo);
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
