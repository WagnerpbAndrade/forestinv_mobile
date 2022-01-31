import 'package:flutter/material.dart';

class LogoLogin extends StatelessWidget {
  const LogoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
