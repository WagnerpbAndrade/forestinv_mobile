import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/login_controller.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<LoginController>();
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => controller.loginWithGoogle(),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: ColorsConst.corBordaBotaoGoogle),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorsConst.fundoBotaoGoogle)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              child: Image.asset('assets/images/google.png', fit: BoxFit.cover),
            ),
            const Text(
              "Entrar com Google",
              style: TextStyle(color: ColorsConst.corTextoBotaoGoogle),
            ),
          ],
        ),
      ),
    );
  }
}
