import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/stores/settings_store.dart';

class FieldTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const FieldTitle({required this.title, this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    final settingsStore = Modular.get<SettingsStore>();
    return Padding(
      padding: const EdgeInsets.only(
        left: 3,
        bottom: 4,
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Observer(
            builder: (_) {
              return Text(
                '$title',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: settingsStore.fontSize,
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ),
          const SizedBox(
            width: 5,
          ),
          Observer(
            builder: (_) {
              return Text(
                '$subtitle',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: settingsStore.fontSize,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
