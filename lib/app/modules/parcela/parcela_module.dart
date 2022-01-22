import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/output/parcela_store.dart';
import 'presenter/ui/parcela_page.dart';

class ParcelaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ParcelaStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ParcelaPage()),
  ];
}
