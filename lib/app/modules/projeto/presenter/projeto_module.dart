import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/medicao_module.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/parcela_module.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/delete_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_id_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_name_project_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_name_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/save_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/update_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/datasource/project_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/repository/projeto_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/controllers/projeto_controller.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/new_projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/pages/new_project_page.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/pages/projeto_page.dart';

import 'output/controllers/new_project_controller.dart';

class ProjetoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ProjetoStore()),
    Bind((i) => NewProjetoStore()),
    Bind((i) => NewProjectController()),
    Bind((i) => ProjectDatasourceImpl(i.get())),
    Bind((i) => ProjectRepositoryImpl(i.get())),
    Bind((i) => GetAllProjectsUsecaseImpl(i.get())),
    Bind((i) => GetByIdProjectUsecaseImpl(i.get())),
    Bind((i) => GetByNameProjectUsecaseImpl(i.get())),
    Bind((i) => SaveProjectUsecaseImpl(i.get())),
    Bind((i) => ProjetoController()),
    Bind((i) => DeleteProjectUsecaseImpl(i())),
    Bind((i) => UpdateProjectUsecaseImpl(i())),
    Bind((i) => GetAllProjectByUserUsecaseImpl(i())),
    Bind((i) => GetByNameProjectAndUserUsecaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProjetoPage()),
    ChildRoute(
      RouterConst.ADD_PROJECT_ROUTER,
      child: (_, args) => NewProjectPage(
        project: args.data,
      ),
    ),
    ModuleRoute('/parcela', module: ParcelaModule()),
    ModuleRoute('/medicao', module: MedicaoModule()),
  ];
}
