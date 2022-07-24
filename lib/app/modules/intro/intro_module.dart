import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/intro/presenter/outputs/stores/intro_store.dart';
import 'package:forestinv_mobile/app/modules/intro/presenter/ui/pages/intro_page.dart';

class IntroModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => IntroStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const IntroPage()),
  ];
}
