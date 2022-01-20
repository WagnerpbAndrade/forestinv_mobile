import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/new_project_page.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/projeto_page.dart';

class ProjetoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProjetoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProjetoPage(project: args.data)),
    ChildRoute(RouterConst.ADD_PROJECT_ROUTER,
        child: (_, args) => NewProjectPage())
  ];
}
