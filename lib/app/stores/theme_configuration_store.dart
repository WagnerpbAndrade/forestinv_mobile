import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/custom_theme.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theme_configuration_store.g.dart';

class ThemeConfigurationStore = ThemeConfigurationStoreBase
    with _$ThemeConfigurationStore;

abstract class ThemeConfigurationStoreBase with Store {
  final String DARK_THEME = 'Dark';
  final String LIGHT_THEME = 'Light';
  final String THEME_MODE = 'theme_mode';
  final themes = ['Dark', 'Light'];

  @observable
  String selectedTheme = 'Dark';

  @action
  void setSelectedTheme(String value) => selectedTheme = value;

  @observable
  ThemeData? theme = CustomTheme.blueDarkTheme();

  @action
  void setTheme(ThemeData value) => theme = value;

  Future<void> onThemeChange(String value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value == DARK_THEME) {
      print('OnThemeChange Dark: $value');
      setTheme(CustomTheme.blueDarkTheme());
      prefs.setString(THEME_MODE, DARK_THEME);
    }
    if (value == LIGHT_THEME) {
      print('OnThemeChange Light: $value');
      setTheme(CustomTheme.whiteTheme());
      prefs.setString(THEME_MODE, LIGHT_THEME);
    }
  }

  Future<void> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeSaved = prefs.getString(THEME_MODE);
    if (themeSaved != null) {
      if (themeSaved == DARK_THEME) {
        print('entrou no dark');
        setTheme(CustomTheme.blueDarkTheme());
      }
      if (themeSaved == LIGHT_THEME) {
        print('entrou no light');
        setTheme(CustomTheme.whiteTheme());
      }
    }
  }
}
