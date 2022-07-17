// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regra_consistencia_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegraConsistenciaStore on _RegraConsistenciaStoreBase, Store {
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_RegraConsistenciaStoreBase.showProgress'))
          .value;

  late final _$errorAtom =
      Atom(name: '_RegraConsistenciaStoreBase.error', context: context);

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
      Atom(name: '_RegraConsistenciaStoreBase.loading', context: context);

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

  late final _$_RegraConsistenciaStoreBaseActionController =
      ActionController(name: '_RegraConsistenciaStoreBase', context: context);

  @override
  void addNewRegras(List<RegraConsistencia> newRegras) {
    final _$actionInfo = _$_RegraConsistenciaStoreBaseActionController
        .startAction(name: '_RegraConsistenciaStoreBase.addNewRegras');
    try {
      return super.addNewRegras(newRegras);
    } finally {
      _$_RegraConsistenciaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? value) {
    final _$actionInfo = _$_RegraConsistenciaStoreBaseActionController
        .startAction(name: '_RegraConsistenciaStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_RegraConsistenciaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_RegraConsistenciaStoreBaseActionController
        .startAction(name: '_RegraConsistenciaStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_RegraConsistenciaStoreBaseActionController.endAction(_$actionInfo);
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
