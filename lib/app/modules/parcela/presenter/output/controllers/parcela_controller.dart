import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/get_all_parcela_by_project.dart';

class ParcelaController {
  Future<List<Parcela>> getAllParcelaByProject(String projectId) async {
    final usecase = Modular.get<GetAllParcelaByProject>();
    try {
      final response = await usecase.getParcelasPagination(projectId);
      return response.parcelas;
    } catch (e) {
      rethrow;
    }
  }

  void goToMedicaoPage(Parcela parcela) {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.MEDICAO_ROUTER}',
        arguments: parcela);
  }

  void goToCreateParcelaPage(final Parcela? parcela, final String? projetoId,
      {final bool isNewParcela = true}) {
    if (isNewParcela) {
      Modular.to.pushNamed(
          '${RouterConst.PROJECT_ROUTER}${RouterConst.PARCELA_ROUTER}${RouterConst.CREATE_PARCELA_ROUTER}',
          arguments: [parcela, projetoId]);
    } else {
      Modular.to.pushNamed(
          '${RouterConst.PROJECT_ROUTER}${RouterConst.PARCELA_ROUTER}${RouterConst.CREATE_PARCELA_ROUTER}',
          arguments: [parcela]);
    }
  }
}
