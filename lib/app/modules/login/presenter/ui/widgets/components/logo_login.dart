import 'package:flutter/material.dart';

class LogoLogin extends StatelessWidget {
  const LogoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return SizedBox(
      height: width * 0.4,
      width: height * 0.4,
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
