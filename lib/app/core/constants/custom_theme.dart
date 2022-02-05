import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class CustomTheme {
  static ThemeData apply() {
    return ThemeData(
      colorScheme: const ColorScheme(
        primary: ColorsConst.primary,
        onPrimary: ColorsConst.onPrimary,
        primaryVariant: ColorsConst.primaryVariant,
        secondary: ColorsConst.secondary,
        onSecondary: ColorsConst.onSecondary,
        secondaryVariant: ColorsConst.secondaryVariant,
        brightness: Brightness.light,
        onBackground: ColorsConst.onBackground,
        background: ColorsConst.background,
        onSurface: ColorsConst.onSurface,
        surface: ColorsConst.surface,
        onError: Colors.red,
        error: Colors.red,
      ),
      buttonTheme: const ButtonThemeData(),
    );
  }
}
