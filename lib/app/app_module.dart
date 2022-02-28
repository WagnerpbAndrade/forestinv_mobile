import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_guard.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/intro/intro_module.dart';
import 'package:forestinv_mobile/app/modules/login/login_module.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/projeto_module.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/get_all_regras_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/save_all_regras_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/update_regra_usecase.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/external/data_source/regra_firestore_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/infra/repository/regra_consistencia_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/stores/regra_consistencia_store.dart';
import 'package:forestinv_mobile/helper/location_helper.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => DioClient()),
    Bind.factory((i) => LocationHelper()),
    Bind.singleton((i) => FirebaseAuth.instance),
    Bind.singleton((i) => FirebaseFirestore.instance),
    Bind.singleton((i) => AuthStore(i())),
    Bind.singleton((i) => RegraConsistenciaStore()),
    Bind((i) => RegraFirestoreDatasourceImpl(i())),
    Bind((i) => RegraConsistenciaRepositoryImpl(i())),
    Bind((i) => GetAllRegrasByUserUsecaseImpl(i())),
    Bind((i) => SaveAllRegrasByUserUsecaseImpl(i())),
    Bind((i) => UpdateRegraUsecaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute(RouterConst.PROJECT_ROUTER,
        module: ProjetoModule(), guards: [AuthGuard()]),
    ModuleRoute(RouterConst.REGRAS_ROUTER,
        module: ProjetoModule(), guards: [AuthGuard()]),
    ModuleRoute('/intro', module: IntroModule())
  ];
}
