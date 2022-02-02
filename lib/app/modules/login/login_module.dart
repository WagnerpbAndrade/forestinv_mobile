import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/login_with_email_password_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/logout_google_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/external/data_source/login_firebase_data_source_impl.dart';
import 'package:forestinv_mobile/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/login_controller.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/ui/pages/login_page.dart';

import 'presenter/output/stores/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginStore()),
    Bind((i) => LoginController()),
    Bind((i) => LoginFirebaseDataSourceImpl()),
    Bind((i) => LoginRepositoryImpl(i())),
    Bind((i) => LoginGoogleUsecaseImpl(i())),
    Bind((i) => LogoutGoogleUsecaseImpl(i())),
    Bind((i) => LoginWithEmailPasswordUsecaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => LoginPage()),
  ];
}
