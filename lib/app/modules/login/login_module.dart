import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_with_email_password_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/recovery_password_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/sign_up_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/sign_up_store.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/pages/login_page.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/pages/recover_page.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/pages/sign_up_page.dart';

import 'presenter/output/stores/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginStore()),
    Bind((i) => SignUpStore()),
    Bind((i) => LoginWithEmailPasswordUsecaseImpl(i())),
    Bind((i) => RecoveryPasswordUsecaseImpl(i())),
    Bind((i) => SignUpUsecaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => LoginPage()),
    ChildRoute(RouterConst.RECOVERY_PASSWORD_ROUTER,
        child: (_, args) => RecoverPage(args.data)),
    ChildRoute(RouterConst.SIGN_UP_ROUTER, child: (_, args) => SignUpPage()),
  ];
}
