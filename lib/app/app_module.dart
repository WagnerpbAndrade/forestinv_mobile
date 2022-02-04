import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_guard.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/intro/intro_module.dart';
import 'package:forestinv_mobile/app/modules/login/login_module.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/projeto_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => DioClient()),
    Bind.singleton((i) => FirebaseAuth.instance),
    Bind.singleton((i) => AuthStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute(RouterConst.PROJECT_ROUTER,
        module: ProjetoModule(), guards: [AuthGuard()]),
    ModuleRoute('/intro', module: IntroModule())
  ];
}
