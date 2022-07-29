// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_parcela_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastrarParcelaStore on _CadastrarParcelaStoreBase, Store {
  Computed<bool>? _$identificadorParcelaIsValidComputed;

  @override
  bool get identificadorParcelaIsValid =>
      (_$identificadorParcelaIsValidComputed ??= Computed<bool>(
              () => super.identificadorParcelaIsValid,
              name: '_CadastrarParcelaStoreBase.identificadorParcelaIsValid'))
          .value;
  Computed<bool>? _$areaParcelaIsValidComputed;

  @override
  bool get areaParcelaIsValid => (_$areaParcelaIsValidComputed ??=
          Computed<bool>(() => super.areaParcelaIsValid,
              name: '_CadastrarParcelaStoreBase.areaParcelaIsValid'))
      .value;
  Computed<bool>? _$identificadorTalhaoIsValidComputed;

  @override
  bool get identificadorTalhaoIsValid =>
      (_$identificadorTalhaoIsValidComputed ??= Computed<bool>(
              () => super.identificadorTalhaoIsValid,
              name: '_CadastrarParcelaStoreBase.identificadorTalhaoIsValid'))
          .value;
  Computed<bool>? _$areaTalhaoIsValidComputed;

  @override
  bool get areaTalhaoIsValid => (_$areaTalhaoIsValidComputed ??= Computed<bool>(
          () => super.areaTalhaoIsValid,
          name: '_CadastrarParcelaStoreBase.areaTalhaoIsValid'))
      .value;
  Computed<bool>? _$espacamentoIsValidComputed;

  @override
  bool get espacamentoIsValid => (_$espacamentoIsValidComputed ??=
          Computed<bool>(() => super.espacamentoIsValid,
              name: '_CadastrarParcelaStoreBase.espacamentoIsValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CadastrarParcelaStoreBase.isFormValid'))
          .value;
  Computed<Function?>? _$cadastrarOnPressedComputed;

  @override
  Function? get cadastrarOnPressed => (_$cadastrarOnPressedComputed ??=
          Computed<Function?>(() => super.cadastrarOnPressed,
              name: '_CadastrarParcelaStoreBase.cadastrarOnPressed'))
      .value;
  Computed<Function?>? _$editarOnPressedComputed;

  @override
  Function? get editarOnPressed => (_$editarOnPressedComputed ??=
          Computed<Function?>(() => super.editarOnPressed,
              name: '_CadastrarParcelaStoreBase.editarOnPressed'))
      .value;

  late final _$selectedDateAtom =
      Atom(name: '_CadastrarParcelaStoreBase.selectedDate', context: context);

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

  late final _$identificadorParcelaAtom = Atom(
      name: '_CadastrarParcelaStoreBase.identificadorParcela',
      context: context);

  @override
  String get identificadorParcela {
    _$identificadorParcelaAtom.reportRead();
    return super.identificadorParcela;
  }

  @override
  set identificadorParcela(String value) {
    _$identificadorParcelaAtom.reportWrite(value, super.identificadorParcela,
        () {
      super.identificadorParcela = value;
    });
  }

  late final _$areaParcelaAtom =
      Atom(name: '_CadastrarParcelaStoreBase.areaParcela', context: context);

  @override
  String get areaParcela {
    _$areaParcelaAtom.reportRead();
    return super.areaParcela;
  }

  @override
  set areaParcela(String value) {
    _$areaParcelaAtom.reportWrite(value, super.areaParcela, () {
      super.areaParcela = value;
    });
  }

  late final _$identificadorTalhaoAtom = Atom(
      name: '_CadastrarParcelaStoreBase.identificadorTalhao', context: context);

  @override
  String get identificadorTalhao {
    _$identificadorTalhaoAtom.reportRead();
    return super.identificadorTalhao;
  }

  @override
  set identificadorTalhao(String value) {
    _$identificadorTalhaoAtom.reportWrite(value, super.identificadorTalhao, () {
      super.identificadorTalhao = value;
    });
  }

  late final _$areaTalhaoAtom =
      Atom(name: '_CadastrarParcelaStoreBase.areaTalhao', context: context);

  @override
  String get areaTalhao {
    _$areaTalhaoAtom.reportRead();
    return super.areaTalhao;
  }

  @override
  set areaTalhao(String value) {
    _$areaTalhaoAtom.reportWrite(value, super.areaTalhao, () {
      super.areaTalhao = value;
    });
  }

  late final _$espacamentoAtom =
      Atom(name: '_CadastrarParcelaStoreBase.espacamento', context: context);

  @override
  String get espacamento {
    _$espacamentoAtom.reportRead();
    return super.espacamento;
  }

  @override
  set espacamento(String value) {
    _$espacamentoAtom.reportWrite(value, super.espacamento, () {
      super.espacamento = value;
    });
  }

  late final _$latitudeAtom =
      Atom(name: '_CadastrarParcelaStoreBase.latitude', context: context);

  @override
  String get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(String value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  late final _$longitudeAtom =
      Atom(name: '_CadastrarParcelaStoreBase.longitude', context: context);

  @override
  String get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(String value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  late final _$loadingLatLongAtom =
      Atom(name: '_CadastrarParcelaStoreBase.loadingLatLong', context: context);

  @override
  bool get loadingLatLong {
    _$loadingLatLongAtom.reportRead();
    return super.loadingLatLong;
  }

  @override
  set loadingLatLong(bool value) {
    _$loadingLatLongAtom.reportWrite(value, super.loadingLatLong, () {
      super.loadingLatLong = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_CadastrarParcelaStoreBase.loading', context: context);

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
      Atom(name: '_CadastrarParcelaStoreBase.error', context: context);

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

  late final _$savedParcelaAtom =
      Atom(name: '_CadastrarParcelaStoreBase.savedParcela', context: context);

  @override
  bool get savedParcela {
    _$savedParcelaAtom.reportRead();
    return super.savedParcela;
  }

  @override
  set savedParcela(bool value) {
    _$savedParcelaAtom.reportWrite(value, super.savedParcela, () {
      super.savedParcela = value;
    });
  }

  late final _$updatedParcelaAtom =
      Atom(name: '_CadastrarParcelaStoreBase.updatedParcela', context: context);

  @override
  bool get updatedParcela {
    _$updatedParcelaAtom.reportRead();
    return super.updatedParcela;
  }

  @override
  set updatedParcela(bool value) {
    _$updatedParcelaAtom.reportWrite(value, super.updatedParcela, () {
      super.updatedParcela = value;
    });
  }

  late final _$_cadastrarAsyncAction =
      AsyncAction('_CadastrarParcelaStoreBase._cadastrar', context: context);

  @override
  Future<void> _cadastrar() {
    return _$_cadastrarAsyncAction.run(() => super._cadastrar());
  }

  late final _$_editarAsyncAction =
      AsyncAction('_CadastrarParcelaStoreBase._editar', context: context);

  @override
  Future<void> _editar() {
    return _$_editarAsyncAction.run(() => super._editar());
  }

  late final _$openDatePickerAsyncAction = AsyncAction(
      '_CadastrarParcelaStoreBase.openDatePicker',
      context: context);

  @override
  Future<void> openDatePicker(BuildContext context) {
    return _$openDatePickerAsyncAction.run(() => super.openDatePicker(context));
  }

  late final _$_CadastrarParcelaStoreBaseActionController =
      ActionController(name: '_CadastrarParcelaStoreBase', context: context);

  @override
  void setSelectedDate(DateTime? value) {
    final _$actionInfo = _$_CadastrarParcelaStoreBaseActionController
        .startAction(name: '_CadastrarParcelaStoreBase.setSelectedDate');
    try {
      return super.setSelectedDate(value);
    } finally {
      _$_CadastrarParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdentificadorParcela(String value) {
    final _$actionInfo =
        _$_CadastrarParcelaStoreBaseActionController.startAction(
            name: '_CadastrarParcelaStoreBase.setIdentificadorParcela');
    try {
      return super.setIdentificadorParcela(value);
    } finally {
      _$_CadastrarParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAreaParcela(String value) {
    final _$actionInfo = _$_CadastrarParcelaStoreBaseActionController
        .startAction(name: '_CadastrarParcelaStoreBase.setAreaParcela');
    try {
      return super.setAreaParcela(value);
    } finally {
      _$_CadastrarParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdentificadorTalhao(String value) {
    final _$actionInfo = _$_CadastrarParcelaStoreBaseActionController
        .startAction(name: '_CadastrarParcelaStoreBase.setIdentificadorTalhao');
    try {
      return super.setIdentificadorTalhao(value);
    } finally {
      _$_CadastrarParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAreaTalhao(String value) {
    final _$actionInfo = _$_CadastrarParcelaStoreBaseActionController
        .startAction(name: '_CadastrarParcelaStoreBase.setAreaTalhao');
    try {
      return super.setAreaTalhao(value);
    } finally {
      _$_CadastrarParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEspacamento(String value) {
    final _$actionInfo = _$_CadastrarParcelaStoreBaseActionController
        .startAction(name: '_CadastrarParcelaStoreBase.setEspacamento');
    try {
      return super.setEspacamento(value);
    } finally {
      _$_CadastrarParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLatitude(String value) {
    final _$actionInfo = _$_CadastrarParcelaStoreBaseActionController
        .startAction(name: '_CadastrarParcelaStoreBase.setLatitude');
    try {
      return super.setLatitude(value);
    } finally {
      _$_CadastrarParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLongitude(String value) {
    final _$actionInfo = _$_CadastrarParcelaStoreBaseActionController
        .startAction(name: '_CadastrarParcelaStoreBase.setLongitude');
    try {
      return super.setLongitude(value);
    } finally {
      _$_CadastrarParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate},
identificadorParcela: ${identificadorParcela},
areaParcela: ${areaParcela},
identificadorTalhao: ${identificadorTalhao},
areaTalhao: ${areaTalhao},
espacamento: ${espacamento},
latitude: ${latitude},
longitude: ${longitude},
loadingLatLong: ${loadingLatLong},
loading: ${loading},
error: ${error},
savedParcela: ${savedParcela},
updatedParcela: ${updatedParcela},
identificadorParcelaIsValid: ${identificadorParcelaIsValid},
areaParcelaIsValid: ${areaParcelaIsValid},
identificadorTalhaoIsValid: ${identificadorTalhaoIsValid},
areaTalhaoIsValid: ${areaTalhaoIsValid},
espacamentoIsValid: ${espacamentoIsValid},
isFormValid: ${isFormValid},
cadastrarOnPressed: ${cadastrarOnPressed},
editarOnPressed: ${editarOnPressed}
    ''';
  }
}
