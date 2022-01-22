import 'package:forestinv_mobile/app//modules/parcela/parcela_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/parcela/output/parcela_page.dart';

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
