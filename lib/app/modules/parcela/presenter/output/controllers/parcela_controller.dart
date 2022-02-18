import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/delete_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/list_all_parcela_by_projeto.dart';

class ParcelaController {
  Future<List<Parcela>> getAllParcelaByProject(String projectId) async {
    final usecase = Modular.get<ListAllParcelaByProjeto>();
    try {
      return await usecase.call(projectId);
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
          arguments: [parcela, projetoId]);
    }
  }

  Future<ApiResponse> delete(final String parcelaId) {
    final usecase = Modular.get<DeleteParcelaUsecase>();
    return usecase.call(parcelaId);
  }
}
