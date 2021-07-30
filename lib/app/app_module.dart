import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/intro/intro_module.dart';
import 'package:forestinv_mobile/app/modules/projeto/projeto_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: ProjetoModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/intro', module: IntroModule())
  ];
}
