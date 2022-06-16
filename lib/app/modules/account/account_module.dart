import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/account/domain/usecases/update_password_usecase.dart';
import 'package:forestinv_mobile/app/modules/account/domain/usecases/update_profile_usecase.dart';
import 'package:forestinv_mobile/app/modules/account/external/datasource/firebase_account_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/account/infra/repositories/account_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/account/presenter/output/stores/edit_account_store.dart';
import 'package:forestinv_mobile/app/modules/account/presenter/ui/pages/edit_account_page.dart';

import 'presenter/output/stores/account_store.dart';
import 'presenter/ui/pages/account_page.dart';

class AccountModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AccountStore()),
    Bind.lazySingleton((i) => EditAccountStore()),
    Bind.factory((i) => FirebaseAccountDatasourceImpl()),
    Bind.factory((i) => AccountRepositoryImpl(i())),
    Bind.factory((i) => UpdateProfileUsecaseImpl(i())),
    Bind.factory((i) => UpdatePasswordUsecaseImpl(i())),
    Bind.lazySingleton((i) => EditAccountStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AccountPage()),
    ChildRoute(RouterConst.EDIT_ACCOUNT_ROUTER_PAGE,
        child: (_, args) => EditAccountPage())
  ];
}
