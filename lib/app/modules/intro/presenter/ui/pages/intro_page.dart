import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/utils/responsive_config.dart';
import 'package:forestinv_mobile/app/modules/intro/presenter/outputs/stores/intro_store.dart';

class IntroPage extends StatefulWidget {
  const IntroPage();
  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  final IntroStore store = Modular.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);
    return Scaffold(
      backgroundColor: ColorsConst.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: ResponsiveConfig.screenWidth,
            height: ResponsiveConfig.screenHeight! * 0.35,
            decoration: BoxDecoration(
                color: ColorsConst.secondary,
                borderRadius: BorderRadius.circular(100)),
          )
        ],
      ),
    );
  }
}
