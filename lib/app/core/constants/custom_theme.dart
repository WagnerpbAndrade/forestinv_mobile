import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class CustomTheme {
  static ThemeData apply() {
    return ThemeData(
      primaryColor: ColorsConst.primaryColor,
      accentColor: ColorsConst.secundaryColor,
    );
  }
}
