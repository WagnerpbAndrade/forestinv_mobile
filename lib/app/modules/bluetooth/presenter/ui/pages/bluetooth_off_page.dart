import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class BluetoothOffPage extends StatelessWidget {
  final BluetoothState? state;

  const BluetoothOffPage({Key? key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.secondaryVariant,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Bluetooth Adapter is ${state != null ? state.toString().substring(15) : 'not available'}.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
