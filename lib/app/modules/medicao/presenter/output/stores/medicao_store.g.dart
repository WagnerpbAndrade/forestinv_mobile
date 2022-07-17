// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MedicaoStore on _MedicaoStoreBase, Store {
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_MedicaoStoreBase.showProgress'))
          .value;

  late final _$errorAtom =
      Atom(name: '_MedicaoStoreBase.error', context: context);

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
      Atom(name: '_MedicaoStoreBase.loading', context: context);

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

  late final _$deleteMedicaoAsyncAction =
      AsyncAction('_MedicaoStoreBase.deleteMedicao', context: context);

  @override
  Future<void> deleteMedicao(dynamic medicaoId) {
    return _$deleteMedicaoAsyncAction.run(() => super.deleteMedicao(medicaoId));
  }

  late final _$_MedicaoStoreBaseActionController =
      ActionController(name: '_MedicaoStoreBase', context: context);

  @override
  void addNewMedicoes(List<Medicao> newMedicoes) {
    final _$actionInfo = _$_MedicaoStoreBaseActionController.startAction(
        name: '_MedicaoStoreBase.addNewMedicoes');
    try {
      return super.addNewMedicoes(newMedicoes);
    } finally {
      _$_MedicaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? value) {
    final _$actionInfo = _$_MedicaoStoreBaseActionController.startAction(
        name: '_MedicaoStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_MedicaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_MedicaoStoreBaseActionController.startAction(
        name: '_MedicaoStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_MedicaoStoreBaseActionController.endAction(_$actionInfo);
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
