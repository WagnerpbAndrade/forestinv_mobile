import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class CustomTheme {
  static ThemeData apply() {
    return ThemeData(
      colorScheme: const ColorScheme.light(primary: ColorsConst.primaryColor),
    );
  }
}
