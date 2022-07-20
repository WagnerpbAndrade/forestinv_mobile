// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_medicao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastrarMedicaoStore on _CadastrarMedicaoStoreBase, Store {
  Computed<bool>? _$identificadorIsValidComputed;

  @override
  bool get identificadorIsValid => (_$identificadorIsValidComputed ??=
          Computed<bool>(() => super.identificadorIsValid,
              name: '_CadastrarMedicaoStoreBase.identificadorIsValid'))
      .value;
  Computed<bool>? _$descricaoIsValidComputed;

  @override
  bool get descricaoIsValid => (_$descricaoIsValidComputed ??= Computed<bool>(
          () => super.descricaoIsValid,
          name: '_CadastrarMedicaoStoreBase.descricaoIsValid'))
      .value;
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

  late final _$identificadorAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.identificador', context: context);

  @override
  String get identificador {
    _$identificadorAtom.reportRead();
    return super.identificador;
  }

  @override
  set identificador(String value) {
    _$identificadorAtom.reportWrite(value, super.identificador, () {
      super.identificador = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.selectedDate', context: context);

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

  late final _$descricaoAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.descricao', context: context);

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  late final _$nomeResponsavelAtom = Atom(
      name: '_CadastrarMedicaoStoreBase.nomeResponsavel', context: context);

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

  late final _$loadingAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.loading', context: context);

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

  late final _$errorAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.error', context: context);

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

  late final _$savedMedicaoAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.savedMedicao', context: context);

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

  late final _$updatedMedicaoAtom =
      Atom(name: '_CadastrarMedicaoStoreBase.updatedMedicao', context: context);

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

  late final _$_cadastrarAsyncAction =
      AsyncAction('_CadastrarMedicaoStoreBase._cadastrar', context: context);

  @override
  Future<void> _cadastrar() {
    return _$_cadastrarAsyncAction.run(() => super._cadastrar());
  }

  late final _$_editarAsyncAction =
      AsyncAction('_CadastrarMedicaoStoreBase._editar', context: context);

  @override
  Future<void> _editar() {
    return _$_editarAsyncAction.run(() => super._editar());
  }

  late final _$openDatePickerAsyncAction = AsyncAction(
      '_CadastrarMedicaoStoreBase.openDatePicker',
      context: context);

  @override
  Future<void> openDatePicker(BuildContext context) {
    return _$openDatePickerAsyncAction.run(() => super.openDatePicker(context));
  }

  late final _$_CadastrarMedicaoStoreBaseActionController =
      ActionController(name: '_CadastrarMedicaoStoreBase', context: context);

  @override
  void setIdentificador(String value) {
    final _$actionInfo = _$_CadastrarMedicaoStoreBaseActionController
        .startAction(name: '_CadastrarMedicaoStoreBase.setIdentificador');
    try {
      return super.setIdentificador(value);
    } finally {
      _$_CadastrarMedicaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void setDescricao(String value) {
    final _$actionInfo = _$_CadastrarMedicaoStoreBaseActionController
        .startAction(name: '_CadastrarMedicaoStoreBase.setDescricao');
    try {
      return super.setDescricao(value);
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
identificador: ${identificador},
selectedDate: ${selectedDate},
descricao: ${descricao},
nomeResponsavel: ${nomeResponsavel},
loading: ${loading},
error: ${error},
savedMedicao: ${savedMedicao},
updatedMedicao: ${updatedMedicao},
identificadorIsValid: ${identificadorIsValid},
descricaoIsValid: ${descricaoIsValid},
nomeResponsavelIsValid: ${nomeResponsavelIsValid},
isFormValid: ${isFormValid},
cadastrarOnPressed: ${cadastrarOnPressed},
editarOnPressed: ${editarOnPressed}
    ''';
  }
}
