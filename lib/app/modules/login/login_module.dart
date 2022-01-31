import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/logout_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/external/data_source/login_firebase_data_source_impl.dart';
import 'package:forestinv_mobile/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/login_controller.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/pages/login_page.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/projeto_module.dart';

import 'presenter/output/stores/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => LoginController()),
    Bind.lazySingleton((i) => LoginFirebaseDataSourceImpl()),
    Bind.lazySingleton((i) => LoginRepositoryImpl(i())),
    Bind.lazySingleton((i) => LoginGoogleUsecaseImpl(i())),
    Bind.lazySingleton((i) => LogoutGoogleUsecaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
    //ModuleRoute(RouterConst.PROJECT_ROUTER, module: ProjetoModule()),
  ];
}
