import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/constants/shared_preferences_const.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/home_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/projeto_module.dart';
import 'package:forestinv_mobile/app/stores/settings_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ModularState<SettingsScreen, SettingsStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: Observer(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Container(
                      color: ColorsConst.primary,
                      child: Row(
                        children: const [
                          Icon(Icons.info_outline, color: Colors.white),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Reinicie o aplicativo após escolher a fonte',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Tamanho da fonte',
                    style: TextStyle(fontSize: store.fontSize),
                  ),
                  SfSlider(
                    min: 12,
                    max: 20,
                    value: store.fontSize,
                    interval: 2,
                    showTicks: false,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 2,
                    stepSize: 2,
                    onChanged: (value) async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setDouble(
                          SharedPreferencesConst.FONT_SIZE_KEY, value);
                      store.setFontSize(prefs
                          .getDouble(SharedPreferencesConst.FONT_SIZE_KEY)!);
                      print(
                          'Settings font_size: ${prefs.getDouble(SharedPreferencesConst.FONT_SIZE_KEY)!}');
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
