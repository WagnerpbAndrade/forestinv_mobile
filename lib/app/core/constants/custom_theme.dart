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
      ),
      dialogTheme: const DialogTheme(
        contentTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: ColorsConst.background,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
      scaffoldBackgroundColor: ColorsConst.background,
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

  static ThemeData whiteTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFF2F2F2),
        onPrimary: Colors.black,
        primaryContainer: ColorsConst.primaryVariant,
        secondary: Color(0xFFF2F2F2),
        onSecondary: Colors.black,
        secondaryContainer: ColorsConst.secondaryVariant,
        onBackground: Colors.white,
        background: Colors.red,
        onSurface: Colors.black,
        surface: Colors.black,
        onError: Colors.red,
        error: Colors.red,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (!states.contains(MaterialState.disabled)) {
            return Colors.black.withAlpha(120);
          }
        }),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (!states.contains(MaterialState.focused)) {
            return const TextStyle(color: Colors.white);
          }
        }),
      )),
      dialogTheme: const DialogTheme(
        contentTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Color(0xFFF2F2F2),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.black,
      ),
      scaffoldBackgroundColor: const Color(0xFFDBC9C5),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF2F2F2),
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFFF2F2F2),
      ),
      cardColor: const Color(0xFFF2F2F2),
      buttonTheme: ButtonThemeData(
        buttonColor: ColorsConst.onError,
        disabledColor: const Color(0xFFF2F2F2).withAlpha(120),
        highlightColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      focusColor: Colors.black,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.black,
        selectionHandleColor: Colors.red,
      ),
      listTileTheme: const ListTileThemeData(
        tileColor: Colors.black,
      ),
      dividerColor: Colors.black,
      dividerTheme: const DividerThemeData(
        color: Colors.black,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
      ),
    );
  }
}
