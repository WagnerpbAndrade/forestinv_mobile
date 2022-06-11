import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/stores/connectivity_store.dart';
import 'package:mobx/mobx.dart';

class OfflineScreen extends StatefulWidget {
  @override
  _OfflineScreenState createState() => _OfflineScreenState();
}

class _OfflineScreenState
    extends ModularState<OfflineScreen, ConnectivityStore> {
  @override
  void initState() {
    super.initState();

    when((_) => store.connected, () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Modular.to.pop();
              },
              icon: const Icon(
                Icons.close,
                color: ColorsConst.secondary,
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const Center(
                child: Text(
                  'Sem conexão com a internet!',
                  style: TextStyle(
                      color: ColorsConst.secondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
            ),
            const Icon(
              Icons.cloud_off,
              color: ColorsConst.secondary,
              size: 150,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Por favor, verifique a sua conexão com a internet para '
                'continuar utilizando o app.',
                style: TextStyle(
                  color: ColorsConst.secondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
