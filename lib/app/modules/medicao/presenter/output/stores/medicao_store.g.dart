// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedicaoStore on _MedicaoStoreBase, Store {
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_MedicaoStoreBase.showProgress'))
          .value;

  final _$errorAtom = Atom(name: '_MedicaoStoreBase.error');

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

  final _$loadingAtom = Atom(name: '_MedicaoStoreBase.loading');

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

  final _$deleteMedicaoAsyncAction =
      AsyncAction('_MedicaoStoreBase.deleteMedicao');

  @override
  Future<void> deleteMedicao(dynamic medicaoId) {
    return _$deleteMedicaoAsyncAction.run(() => super.deleteMedicao(medicaoId));
  }

  final _$_MedicaoStoreBaseActionController =
      ActionController(name: '_MedicaoStoreBase');

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
