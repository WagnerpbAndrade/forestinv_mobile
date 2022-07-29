import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_guard.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/current_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/logout_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/external/data_source/login_firebase_data_source_impl.dart';
import 'package:forestinv_mobile/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/login/login_module.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/projeto_module.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/get_all_regras_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/save_all_regras_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/update_regra_usecase.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/external/data_source/regra_firestore_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/infra/repository/regra_consistencia_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/stores/regra_consistencia_store.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/regra_consistencia_module.dart';
import 'package:forestinv_mobile/app/stores/connectivity_store.dart';
import 'package:forestinv_mobile/app/stores/settings_store.dart';
import 'package:forestinv_mobile/app/stores/theme_configuration_store.dart';
import 'package:forestinv_mobile/helper/location_helper.dart';
import 'package:forestinv_mobile/helper/toast_helper.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => DioClient()),
    Bind.factory((i) => LocationHelper()),
    Bind.singleton((i) => ConnectivityStore()),
    Bind.singleton((i) => FirebaseAuth.instance),
    Bind.singleton((i) => FirebaseFirestore.instance),
    Bind.singleton((i) => AuthStore()),
    Bind.singleton((i) => RegraConsistenciaStore()),
    Bind((i) => RegraFirestoreDatasourceImpl(i())),
    Bind((i) => RegraConsistenciaRepositoryImpl(i())),
    Bind((i) => GetAllRegrasByUserUsecaseImpl(i())),
    Bind((i) => SaveAllRegrasByUserUsecaseImpl(i())),
    Bind((i) => UpdateRegraUsecaseImpl(i())),
    Bind((i) => LoginFirebaseDataSourceImpl()),
    Bind((i) => LoginRepositoryImpl(i())),
    Bind((i) => LoginGoogleUsecaseImpl(i())),
    Bind((i) => LogoutGoogleUsecaseImpl(i())),
    Bind((i) => CurrentUserUsecaseImpl(i())),
    Bind((i) => ToastHelper()),
    Bind((i) => SettingsStore()),
    Bind((i) => ThemeConfigurationStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    //ModuleRoute(Modular.initialRoute, module: IntroModule()),
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute(RouterConst.PROJECT_ROUTER,
        module: ProjetoModule(), guards: [AuthGuard()]),
    ModuleRoute(RouterConst.REGRAS_ROUTER,
        module: RegraConsistenciaModule(), guards: [AuthGuard()]),
  ];
}
