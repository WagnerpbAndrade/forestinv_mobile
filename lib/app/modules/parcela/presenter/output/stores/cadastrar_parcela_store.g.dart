// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_parcela_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastrarParcelaStore on _CadastrarParcelaStoreBase, Store {
  Computed<bool>? _$numeroIsValidComputed;

  @override
  bool get numeroIsValid =>
      (_$numeroIsValidComputed ??= Computed<bool>(() => super.numeroIsValid,
              name: '_CadastrarParcelaStoreBase.numeroIsValid'))
          .value;
  Computed<bool>? _$areaIsValidComputed;

  @override
  bool get areaIsValid =>
      (_$areaIsValidComputed ??= Computed<bool>(() => super.areaIsValid,
              name: '_CadastrarParcelaStoreBase.areaIsValid'))
          .value;
  Computed<bool>? _$numeroTalhaoIsValidComputed;

  @override
  bool get numeroTalhaoIsValid => (_$numeroTalhaoIsValidComputed ??=
          Computed<bool>(() => super.numeroTalhaoIsValid,
              name: '_CadastrarParcelaStoreBase.numeroTalhaoIsValid'))
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

  late final _$numeroAtom =
      Atom(name: '_CadastrarParcelaStoreBase.numero', context: context);

  @override
  String get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(String value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  late final _$areaAtom =
      Atom(name: '_CadastrarParcelaStoreBase.area', context: context);

  @override
  String get area {
    _$areaAtom.reportRead();
    return super.area;
  }

  @override
  set area(String value) {
    _$areaAtom.reportWrite(value, super.area, () {
      super.area = value;
    });
  }

  late final _$numeroTalhaoAtom =
      Atom(name: '_CadastrarParcelaStoreBase.numeroTalhao', context: context);

  @override
  String get numeroTalhao {
    _$numeroTalhaoAtom.reportRead();
    return super.numeroTalhao;
  }

  @override
  set numeroTalhao(String value) {
    _$numeroTalhaoAtom.reportWrite(value, super.numeroTalhao, () {
      super.numeroTalhao = value;
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
  void setNumero(String value) {
    final _$actionInfo = _$_CadastrarParcelaStoreBaseActionController
        .startAction(name: '_CadastrarParcelaStoreBase.setNumero');
    try {
      return super.setNumero(value);
    } finally {
      _$_CadastrarParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArea(String value) {
    final _$actionInfo = _$_CadastrarParcelaStoreBaseActionController
        .startAction(name: '_CadastrarParcelaStoreBase.setArea');
    try {
      return super.setArea(value);
    } finally {
      _$_CadastrarParcelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumeroTalhao(String value) {
    final _$actionInfo = _$_CadastrarParcelaStoreBaseActionController
        .startAction(name: '_CadastrarParcelaStoreBase.setNumeroTalhao');
    try {
      return super.setNumeroTalhao(value);
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
numero: ${numero},
area: ${area},
numeroTalhao: ${numeroTalhao},
espacamento: ${espacamento},
latitude: ${latitude},
longitude: ${longitude},
loadingLatLong: ${loadingLatLong},
loading: ${loading},
error: ${error},
savedParcela: ${savedParcela},
updatedParcela: ${updatedParcela},
numeroIsValid: ${numeroIsValid},
areaIsValid: ${areaIsValid},
numeroTalhaoIsValid: ${numeroTalhaoIsValid},
espacamentoIsValid: ${espacamentoIsValid},
isFormValid: ${isFormValid},
cadastrarOnPressed: ${cadastrarOnPressed},
editarOnPressed: ${editarOnPressed}
    ''';
  }
}
