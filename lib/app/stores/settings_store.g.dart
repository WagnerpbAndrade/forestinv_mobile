// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on SettingsStoreBase, Store {
  late final _$fontSizeAtom =
      Atom(name: 'SettingsStoreBase.fontSize', context: context);

  @override
  double get fontSize {
    _$fontSizeAtom.reportRead();
    return super.fontSize;
  }

  @override
  set fontSize(double value) {
    _$fontSizeAtom.reportWrite(value, super.fontSize, () {
      super.fontSize = value;
    });
  }

  late final _$SettingsStoreBaseActionController =
      ActionController(name: 'SettingsStoreBase', context: context);

  @override
  void setFontSize(double value) {
    final _$actionInfo = _$SettingsStoreBaseActionController.startAction(
        name: 'SettingsStoreBase.setFontSize');
    try {
      return super.setFontSize(value);
    } finally {
      _$SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fontSize: ${fontSize}
    ''';
  }
}
