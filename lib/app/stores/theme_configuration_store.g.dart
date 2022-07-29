// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_configuration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeConfigurationStore on ThemeConfigurationStoreBase, Store {
  late final _$selectedThemeAtom =
      Atom(name: 'ThemeConfigurationStoreBase.selectedTheme', context: context);

  @override
  String get selectedTheme {
    _$selectedThemeAtom.reportRead();
    return super.selectedTheme;
  }

  @override
  set selectedTheme(String value) {
    _$selectedThemeAtom.reportWrite(value, super.selectedTheme, () {
      super.selectedTheme = value;
    });
  }

  late final _$themeAtom =
      Atom(name: 'ThemeConfigurationStoreBase.theme', context: context);

  @override
  ThemeData? get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeData? value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$ThemeConfigurationStoreBaseActionController =
      ActionController(name: 'ThemeConfigurationStoreBase', context: context);

  @override
  void setSelectedTheme(String value) {
    final _$actionInfo = _$ThemeConfigurationStoreBaseActionController
        .startAction(name: 'ThemeConfigurationStoreBase.setSelectedTheme');
    try {
      return super.setSelectedTheme(value);
    } finally {
      _$ThemeConfigurationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTheme(ThemeData value) {
    final _$actionInfo = _$ThemeConfigurationStoreBaseActionController
        .startAction(name: 'ThemeConfigurationStoreBase.setTheme');
    try {
      return super.setTheme(value);
    } finally {
      _$ThemeConfigurationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTheme: ${selectedTheme},
theme: ${theme}
    ''';
  }
}
