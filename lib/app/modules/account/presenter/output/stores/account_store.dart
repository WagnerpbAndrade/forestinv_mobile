import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:mobx/mobx.dart';

part 'account_store.g.dart';

class AccountStore = _AccountStoreBase with _$AccountStore;

abstract class _AccountStoreBase with Store {
  void goToEditAccount() {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.ACCOUNT_ROUTER}${RouterConst.EDIT_ACCOUNT_ROUTER_PAGE}');
  }
}
