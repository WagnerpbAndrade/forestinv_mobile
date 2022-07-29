import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/stores/theme_configuration_store.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeStore = Modular.get<ThemeConfigurationStore>();
    return Observer(
      builder: (_) {
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
          ],
          locale: const Locale('pt_BR'),
          debugShowCheckedModeBanner: false,
          title: 'ForestInv',
          theme: themeStore.theme,
        ).modular();
      },
    );
  }
}
