import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/stores/settings_store.dart';

class CustomCardList extends StatelessWidget {
  final String titulo;
  final String message;

  const CustomCardList({required this.titulo, required this.message});

  @override
  Widget build(BuildContext context) {
    final settingsStore = Modular.get<SettingsStore>();
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (_) {
              return Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: settingsStore.fontSize,
                    ),
                  ),
                ],
              );
            },
          ),
          Observer(
            builder: (_) {
              return Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: settingsStore.fontSize,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
