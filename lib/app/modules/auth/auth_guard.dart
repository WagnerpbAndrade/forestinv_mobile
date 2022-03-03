import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(Modular.initialRoute);

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    return Modular.get<AuthStore>().isLoggedIn;
  }
}
