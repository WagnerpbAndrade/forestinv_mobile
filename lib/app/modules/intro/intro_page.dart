import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/utils/responsive_config.dart';
import 'package:forestinv_mobile/app/modules/intro/intro_store.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: ColorsConst.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: ResponsiveConfig.screenWidth,
            height: ResponsiveConfig.screenHeight! * 0.35,
            decoration: BoxDecoration(
                color: ColorsConst.secundaryColor,
                borderRadius: BorderRadius.circular(100)),
          )
        ],
      ),
    );
  }
}
