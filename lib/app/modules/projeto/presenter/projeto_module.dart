import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/account/account_module.dart';
import 'package:forestinv_mobile/app/modules/arvore/arvore_module.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/medicao_module.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/parcela_module.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/delete_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_name_project_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_name_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/projeto_get_by_id_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/save_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/update_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/datasource/project_firestore_datasource.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/datasource/projeto_visibilidade_firebase_datasource.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/repository/projeto_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/cadastrar_projeto_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/home_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/stores/visibilidade_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/pages/cadastrar_projeto_page.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/pages/home_page.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/regra_consistencia_module.dart';
import 'package:forestinv_mobile/app/screens/offline/offline_screen.dart';

class ProjetoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => HomeStore()),
    Bind.lazySingleton((i) => VisibilidadeStore()),
    Bind((i) => CadastrarProjetoStore(null)),
    Bind((i) => ProjectRepositoryImpl(i.get())),
    Bind((i) => GetByNameProjectUsecaseImpl(i.get())),
    Bind((i) => SaveProjectUsecaseImpl(i.get())),
    Bind((i) => DeleteProjectUsecaseImpl(i())),
    Bind((i) => UpdateProjectUsecaseImpl(i())),
    Bind((i) => GetAllProjectByUserUsecaseImpl(i())),
    Bind((i) => GetByNameProjectAndUserUsecaseImpl(i())),
    Bind((i) => ProjectFirestoreDatasourceImpl(i(), i())),
    Bind((i) => ProjetoVisibilidadeFirebaseDatasource(i())),
    Bind((i) => ProjetoGetByIdUsecaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(RouterConst.PROJECT_ROUTER_PAGE,
        child: (_, args) => const HomePage()),
    ChildRoute(RouterConst.ADD_PROJECT_ROUTER,
        child: (_, args) => CadastrarProjetoPage(projeto: args.data)),
    ChildRoute(RouterConst.OFFLINE_ROUTER_PAGE,
        child: (_, args) => OfflineScreen()),
    ModuleRoute(RouterConst.PARCELA_ROUTER, module: ParcelaModule()),
    ModuleRoute(RouterConst.MEDICAO_ROUTER, module: MedicaoModule()),
    ModuleRoute(RouterConst.ARVORE_ROUTER, module: ArvoreModule()),
    ModuleRoute(RouterConst.REGRAS_ROUTER, module: RegraConsistenciaModule()),
    ModuleRoute(RouterConst.ACCOUNT_ROUTER, module: AccountModule()),
  ];
}
