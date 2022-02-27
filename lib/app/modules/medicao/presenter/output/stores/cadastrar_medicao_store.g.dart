// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_medicao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastrarMedicaoStore on _CadastrarMedicaoStoreBase, Store {
  Computed<bool>? _$nomeResponsavelIsValidComputed;

  @override
  bool get nomeResponsavelIsValid => (_$nomeResponsavelIsValidComputed ??=
          Computed<bool>(() => super.nomeResponsavelIsValid,
              name: '_CadastrarMedicaoStoreBase.nomeResponsavelIsValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CadastrarMedicaoStoreBase.isFormValid'))
          .value;
  Computed<Function?>? _$cadastrarOnPressedComputed;

  @override
  Function? get cadastrarOnPressed => (_$cadastrarOnPressedComputed ??=
          Computed<Function?>(() => super.cadastrarOnPressed,
              name: '_CadastrarMedicaoStoreBase.cadastrarOnPressed'))
      .value;
  Computed<Function?>? _$editarOnPressedComputed;

  @override
  Function? get editarOnPressed => (_$editarOnPressedComputed ??=
          Computed<Function?>(() => super.editarOnPressed,
              name: '_CadastrarMedicaoStoreBase.editarOnPressed'))
      .value;

  final _$selectedDateAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.selectedDate');

  @override
  DateTime? get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime? value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  final _$nomeResponsavelAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.nomeResponsavel');

  @override
  String get nomeResponsavel {
    _$nomeResponsavelAtom.reportRead();
    return super.nomeResponsavel;
  }

  @override
  set nomeResponsavel(String value) {
    _$nomeResponsavelAtom.reportWrite(value, super.nomeResponsavel, () {
      super.nomeResponsavel = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CadastrarMedicaoStoreBase.loading');

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

  final _$errorAtom = Atom(name: '_CadastrarMedicaoStoreBase.error');

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

  final _$savedMedicaoAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.savedMedicao');

  @override
  bool get savedMedicao {
    _$savedMedicaoAtom.reportRead();
    return super.savedMedicao;
  }

  @override
  set savedMedicao(bool value) {
    _$savedMedicaoAtom.reportWrite(value, super.savedMedicao, () {
      super.savedMedicao = value;
    });
  }

  final _$updatedMedicaoAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.updatedMedicao');

  @override
  bool get updatedMedicao {
    _$updatedMedicaoAtom.reportRead();
    return super.updatedMedicao;
  }

  @override
  set updatedMedicao(bool value) {
    _$updatedMedicaoAtom.reportWrite(value, super.updatedMedicao, () {
      super.updatedMedicao = value;
    });
  }

  final _$_cadastrarAsyncAction =
      AsyncAction('_CadastrarMedicaoStoreBase._cadastrar');

  @override
  Future<void> _cadastrar() {
    return _$_cadastrarAsyncAction.run(() => super._cadastrar());
  }

  final _$_editarAsyncAction =
      AsyncAction('_CadastrarMedicaoStoreBase._editar');

  @override
  Future<void> _editar() {
    return _$_editarAsyncAction.run(() => super._editar());
  }

  final _$openDatePickerAsyncAction =
      AsyncAction('_CadastrarMedicaoStoreBase.openDatePicker');

  @override
  Future<void> openDatePicker(BuildContext context) {
    return _$openDatePickerAsyncAction.run(() => super.openDatePicker(context));
  }

  final _$_CadastrarMedicaoStoreBaseActionController =
      ActionController(name: '_CadastrarMedicaoStoreBase');

  @override
  void setSelectedDate(DateTime? value) {
    final _$actionInfo = _$_CadastrarMedicaoStoreBaseActionController
        .startAction(name: '_CadastrarMedicaoStoreBase.setSelectedDate');
    try {
      return super.setSelectedDate(value);
    } finally {
      _$_CadastrarMedicaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNomeResponsavel(String value) {
    final _$actionInfo = _$_CadastrarMedicaoStoreBaseActionController
        .startAction(name: '_CadastrarMedicaoStoreBase.setNomeResponsavel');
    try {
      return super.setNomeResponsavel(value);
    } finally {
      _$_CadastrarMedicaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate},
nomeResponsavel: ${nomeResponsavel},
loading: ${loading},
error: ${error},
savedMedicao: ${savedMedicao},
updatedMedicao: ${updatedMedicao},
nomeResponsavelIsValid: ${nomeResponsavelIsValid},
isFormValid: ${isFormValid},
cadastrarOnPressed: ${cadastrarOnPressed},
editarOnPressed: ${editarOnPressed}
    ''';
  }
}
