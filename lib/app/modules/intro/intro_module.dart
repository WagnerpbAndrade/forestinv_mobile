import 'package:forestinv_mobile/app/modules/intro/intro_page.dart';
import 'package:forestinv_mobile/app/modules/intro/intro_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IntroModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => IntroStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => IntroPage()),
  ];
}
