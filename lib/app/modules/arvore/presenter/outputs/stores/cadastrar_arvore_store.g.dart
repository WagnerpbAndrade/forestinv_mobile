// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_arvore_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastrarArvoreStore on _CadastrarArvoreStoreBase, Store {
  Computed<bool>? _$numeroArvoreIsValidComputed;

  @override
  bool get numeroArvoreIsValid => (_$numeroArvoreIsValidComputed ??=
          Computed<bool>(() => super.numeroArvoreIsValid,
              name: '_CadastrarArvoreStoreBase.numeroArvoreIsValid'))
      .value;
  Computed<bool>? _$dapValidComputed;

  @override
  bool get dapValid =>
      (_$dapValidComputed ??= Computed<bool>(() => super.dapValid,
              name: '_CadastrarArvoreStoreBase.dapValid'))
          .value;
  Computed<bool>? _$estadoArvoreValidComputed;

  @override
  bool get estadoArvoreValid => (_$estadoArvoreValidComputed ??= Computed<bool>(
          () => super.estadoArvoreValid,
          name: '_CadastrarArvoreStoreBase.estadoArvoreValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CadastrarArvoreStoreBase.isFormValid'))
          .value;
  Computed<Function?>? _$cadastrarOnPressedComputed;

  @override
  Function? get cadastrarOnPressed => (_$cadastrarOnPressedComputed ??=
          Computed<Function?>(() => super.cadastrarOnPressed,
              name: '_CadastrarArvoreStoreBase.cadastrarOnPressed'))
      .value;
  Computed<Function?>? _$editarOnPressedComputed;

  @override
  Function? get editarOnPressed => (_$editarOnPressedComputed ??=
          Computed<Function?>(() => super.editarOnPressed,
              name: '_CadastrarArvoreStoreBase.editarOnPressed'))
      .value;

  final _$selectedDateAtom =
      Atom(name: '_CadastrarArvoreStoreBase.selectedDate');

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

  final _$numeroArvoreAtom =
      Atom(name: '_CadastrarArvoreStoreBase.numeroArvore');

  @override
  String get numeroArvore {
    _$numeroArvoreAtom.reportRead();
    return super.numeroArvore;
  }

  @override
  set numeroArvore(String value) {
    _$numeroArvoreAtom.reportWrite(value, super.numeroArvore, () {
      super.numeroArvore = value;
    });
  }

  final _$dapTextAtom = Atom(name: '_CadastrarArvoreStoreBase.dapText');

  @override
  String get dapText {
    _$dapTextAtom.reportRead();
    return super.dapText;
  }

  @override
  set dapText(String value) {
    _$dapTextAtom.reportWrite(value, super.dapText, () {
      super.dapText = value;
    });
  }

  final _$alturaTextAtom = Atom(name: '_CadastrarArvoreStoreBase.alturaText');

  @override
  String get alturaText {
    _$alturaTextAtom.reportRead();
    return super.alturaText;
  }

  @override
  set alturaText(String value) {
    _$alturaTextAtom.reportWrite(value, super.alturaText, () {
      super.alturaText = value;
    });
  }

  final _$latitudeAtom = Atom(name: '_CadastrarArvoreStoreBase.latitude');

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

  final _$longitudeAtom = Atom(name: '_CadastrarArvoreStoreBase.longitude');

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

  final _$loadingLatLongAtom =
      Atom(name: '_CadastrarArvoreStoreBase.loadingLatLong');

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

  final _$observacaoAtom = Atom(name: '_CadastrarArvoreStoreBase.observacao');

  @override
  String get observacao {
    _$observacaoAtom.reportRead();
    return super.observacao;
  }

  @override
  set observacao(String value) {
    _$observacaoAtom.reportWrite(value, super.observacao, () {
      super.observacao = value;
    });
  }

  final _$estadoArvoreAtom =
      Atom(name: '_CadastrarArvoreStoreBase.estadoArvore');

  @override
  EstadoArvore? get estadoArvore {
    _$estadoArvoreAtom.reportRead();
    return super.estadoArvore;
  }

  @override
  set estadoArvore(EstadoArvore? value) {
    _$estadoArvoreAtom.reportWrite(value, super.estadoArvore, () {
      super.estadoArvore = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CadastrarArvoreStoreBase.loading');

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

  final _$errorAtom = Atom(name: '_CadastrarArvoreStoreBase.error');

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

  final _$savedArvoreAtom = Atom(name: '_CadastrarArvoreStoreBase.savedArvore');

  @override
  bool get savedArvore {
    _$savedArvoreAtom.reportRead();
    return super.savedArvore;
  }

  @override
  set savedArvore(bool value) {
    _$savedArvoreAtom.reportWrite(value, super.savedArvore, () {
      super.savedArvore = value;
    });
  }

  final _$updatedArvoreAtom =
      Atom(name: '_CadastrarArvoreStoreBase.updatedArvore');

  @override
  bool get updatedArvore {
    _$updatedArvoreAtom.reportRead();
    return super.updatedArvore;
  }

  @override
  set updatedArvore(bool value) {
    _$updatedArvoreAtom.reportWrite(value, super.updatedArvore, () {
      super.updatedArvore = value;
    });
  }

  final _$_cadastrarAsyncAction =
      AsyncAction('_CadastrarArvoreStoreBase._cadastrar');

  @override
  Future<void> _cadastrar() {
    return _$_cadastrarAsyncAction.run(() => super._cadastrar());
  }

  final _$_editarAsyncAction = AsyncAction('_CadastrarArvoreStoreBase._editar');

  @override
  Future<void> _editar() {
    return _$_editarAsyncAction.run(() => super._editar());
  }

  final _$_CadastrarArvoreStoreBaseActionController =
      ActionController(name: '_CadastrarArvoreStoreBase');

  @override
  void setSelectedDate(DateTime? value) {
    final _$actionInfo = _$_CadastrarArvoreStoreBaseActionController
        .startAction(name: '_CadastrarArvoreStoreBase.setSelectedDate');
    try {
      return super.setSelectedDate(value);
    } finally {
      _$_CadastrarArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumeroArvore(String value) {
    final _$actionInfo = _$_CadastrarArvoreStoreBaseActionController
        .startAction(name: '_CadastrarArvoreStoreBase.setNumeroArvore');
    try {
      return super.setNumeroArvore(value);
    } finally {
      _$_CadastrarArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDapText(String value) {
    final _$actionInfo = _$_CadastrarArvoreStoreBaseActionController
        .startAction(name: '_CadastrarArvoreStoreBase.setDapText');
    try {
      return super.setDapText(value);
    } finally {
      _$_CadastrarArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAlturaText(String value) {
    final _$actionInfo = _$_CadastrarArvoreStoreBaseActionController
        .startAction(name: '_CadastrarArvoreStoreBase.setAlturaText');
    try {
      return super.setAlturaText(value);
    } finally {
      _$_CadastrarArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLatitude(String value) {
    final _$actionInfo = _$_CadastrarArvoreStoreBaseActionController
        .startAction(name: '_CadastrarArvoreStoreBase.setLatitude');
    try {
      return super.setLatitude(value);
    } finally {
      _$_CadastrarArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLongitude(String value) {
    final _$actionInfo = _$_CadastrarArvoreStoreBaseActionController
        .startAction(name: '_CadastrarArvoreStoreBase.setLongitude');
    try {
      return super.setLongitude(value);
    } finally {
      _$_CadastrarArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservacao(String value) {
    final _$actionInfo = _$_CadastrarArvoreStoreBaseActionController
        .startAction(name: '_CadastrarArvoreStoreBase.setObservacao');
    try {
      return super.setObservacao(value);
    } finally {
      _$_CadastrarArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEstadoArvore(EstadoArvore value) {
    final _$actionInfo = _$_CadastrarArvoreStoreBaseActionController
        .startAction(name: '_CadastrarArvoreStoreBase.setEstadoArvore');
    try {
      return super.setEstadoArvore(value);
    } finally {
      _$_CadastrarArvoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate},
numeroArvore: ${numeroArvore},
dapText: ${dapText},
alturaText: ${alturaText},
latitude: ${latitude},
longitude: ${longitude},
loadingLatLong: ${loadingLatLong},
observacao: ${observacao},
estadoArvore: ${estadoArvore},
loading: ${loading},
error: ${error},
savedArvore: ${savedArvore},
updatedArvore: ${updatedArvore},
numeroArvoreIsValid: ${numeroArvoreIsValid},
dapValid: ${dapValid},
estadoArvoreValid: ${estadoArvoreValid},
isFormValid: ${isFormValid},
cadastrarOnPressed: ${cadastrarOnPressed},
editarOnPressed: ${editarOnPressed}
    ''';
  }
}
