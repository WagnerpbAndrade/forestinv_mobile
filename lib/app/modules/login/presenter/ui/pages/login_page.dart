import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/login_store.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/widgets/components/google_login_button.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/widgets/components/logo_login.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/widgets/form_login.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  final firebaseAuth = Modular.get<FirebaseAuth>();

  @override
  void initState() {
    super.initState();
    if (firebaseAuth.currentUser != null) {
      print('User logged: ${firebaseAuth.currentUser}');
      Modular.to.pushNamed('/projeto');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const LogoLogin(),
                FormLogin(),
                const GoogleLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
