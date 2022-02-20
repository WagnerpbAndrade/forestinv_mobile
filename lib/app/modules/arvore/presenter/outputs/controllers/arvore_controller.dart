import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';

class ArvoreController {
  Future<List<Arvore>> getAllArvoresByMedicao(String string) async {
    return [];
  }

  void goToMedicaoPage(Medicao medicao) {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.MEDICAO_ROUTER}${RouterConst.ARVORE_ROUTER}',
        arguments: medicao);
  }
}
