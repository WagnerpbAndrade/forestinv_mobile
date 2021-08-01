import 'package:forestinv_mobile/app/modules/projeto/external/datasource/heroku_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/projeto/projeto_Page.dart';
import 'package:forestinv_mobile/app/modules/projeto/projeto_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProjetoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProjetoStore()),
    Bind.factory((i) => HerokuDatasourceImpl())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProjetoPage()),
  ];
}
