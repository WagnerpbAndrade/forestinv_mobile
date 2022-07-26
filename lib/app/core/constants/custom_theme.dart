import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class CustomTheme {
  static ThemeData apply() {
    return ThemeData(
      colorScheme: const ColorScheme(
        primary: ColorsConst.primary,
        onPrimary: ColorsConst.onPrimary,
        primaryContainer: ColorsConst.primaryVariant,
        secondary: ColorsConst.secondary,
        onSecondary: ColorsConst.onSecondary,
        secondaryContainer: ColorsConst.secondaryVariant,
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

  static ThemeData blueDarkTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: ColorsConst.primary,
        onPrimary: ColorsConst.onPrimary,
        primaryContainer: ColorsConst.primaryVariant,
        secondary: ColorsConst.primary,
        onSecondary: ColorsConst.onSecondary,
        secondaryContainer: ColorsConst.secondaryVariant,
        onBackground: ColorsConst.onBackground,
        background: ColorsConst.background,
        brightness: Brightness.dark,
        onSurface: Colors.white,
        surface: Colors.black,
        onError: Colors.red,
        error: Colors.red,
        onPrimaryContainer: Colors.red,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
      scaffoldBackgroundColor: ColorsConst.background,
      // textTheme: TextTheme(
      //   button: const TextStyle(
      //     color: ColorsConst.background,
      //   ),
      //   labelMedium: const TextStyle(
      //     color: ColorsConst.background,
      //   ),
      //   headlineMedium: const TextStyle(
      //     color: ColorsConst.background,
      //   ),
      // ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsConst.primary,
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: ColorsConst.background,
      ),
      cardColor: ColorsConst.backgroundColorCard,
      buttonTheme: ButtonThemeData(
        buttonColor: ColorsConst.onError,
        disabledColor: ColorsConst.background.withAlpha(120),
        highlightColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      focusColor: Colors.white,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Colors.white,
        selectionHandleColor: Colors.red,
      ),
      listTileTheme: const ListTileThemeData(
        tileColor: Colors.white,
      ),
      dividerColor: Colors.white,
      dividerTheme: const DividerThemeData(
        color: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
      ),
    );
  }
}
