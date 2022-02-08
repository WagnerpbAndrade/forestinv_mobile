import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';

class ParcelaController {
  void goToCreateParcelaPage() {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.PARCELA_ROUTER}${RouterConst.CREATE_PARCELA_ROUTER}');
  }
}
