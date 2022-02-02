import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          //controller.irCadastrarNome();
        },
        child: const Text(
          "Criar conta",
          style: TextStyle(
              color: ColorsConst.primary,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
