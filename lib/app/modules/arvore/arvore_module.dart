import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/pages/arvore_page.dart';

class ArvoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ArvoreStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ArvorePage()),
  ];
}
