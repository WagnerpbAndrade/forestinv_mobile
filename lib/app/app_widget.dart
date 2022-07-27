import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/constants/custom_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      locale: const Locale('pt_BR'),
      debugShowCheckedModeBanner: false,
      title: 'ForestInv',
      theme: CustomTheme.whiteTheme(),
    ).modular();
  }
}
