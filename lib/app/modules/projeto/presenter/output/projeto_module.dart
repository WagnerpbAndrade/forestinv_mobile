import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/medicao_module.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/parcela_module.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_id_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_name_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/datasource/heroku_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/repository/projeto_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/new_project_page.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/projeto_page.dart';

class ProjetoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProjetoStore()),
    Bind((i) => HerokuDatasourceImpl(i.get())),
    Bind((i) => ProjectRepositoryImpl(i.get())),
    Bind((i) => GetAllProjectsUsecaseImpl(i.get())),
    Bind((i) => GetByIdProjectUsecaseImpl(i.get())),
    Bind((i) => GetByNameProjectUsecaseImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProjetoPage()),
    ChildRoute(RouterConst.ADD_PROJECT_ROUTER,
        child: (_, args) => NewProjectPage()),
    ModuleRoute('/parcela', module: ParcelaModule()),
    ModuleRoute('/medicao', module: MedicaoModule()),
  ];
}
