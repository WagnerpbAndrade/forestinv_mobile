import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_with_email_password_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/logout_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/recovery_password_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/sign_up_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/external/data_source/login_firebase_data_source_impl.dart';
import 'package:forestinv_mobile/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/login_controller.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/recovery_password_controller.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/sign_up_controller.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/recovery_password_store.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/sign_up_store.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/pages/login_page.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/pages/recovery_password_page.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/pages/sign_up_page.dart';

import 'presenter/output/stores/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginStore()),
    Bind((i) => RecoveryPasswordStore()),
    Bind((i) => SignUpStore()),
    Bind((i) => LoginController()),
    Bind((i) => SignUpController()),
    Bind((i) => LoginFirebaseDataSourceImpl()),
    Bind((i) => LoginRepositoryImpl(i())),
    Bind((i) => LoginGoogleUsecaseImpl(i())),
    Bind((i) => LogoutGoogleUsecaseImpl(i())),
    Bind((i) => LoginWithEmailPasswordUsecaseImpl(i())),
    Bind((i) => RecoveryPasswordUsecaseImpl(i())),
    Bind((i) => SignUpUsecaseImpl(i())),
    Bind((i) => RecoveryPasswordController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => LoginPage()),
    ChildRoute(RouterConst.RECOVERY_PASSWORD_ROUTER,
        child: (_, args) => const RecoveryPasswordPage()),
    ChildRoute(RouterConst.SIGN_UP_ROUTER,
        child: (_, args) => const SignUpPage()),
  ];
}
