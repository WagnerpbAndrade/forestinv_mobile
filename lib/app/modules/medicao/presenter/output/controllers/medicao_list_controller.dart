import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/delete_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/list_all_medicao_by_parcela.dart';

class MedicaoListController {
  Future<List<Medicao>> getAllMedicaoByParcela(String parcelaId) async {
    final usecase = Modular.get<ListAllMedicaoByParcela>();
    try {
      return await usecase.listAllByParcela(parcelaId);
    } catch (e) {
      rethrow;
    }
  }

  void goToCreateMedicaoPage(final Medicao? medicao, final String? parcelaId,
      {final bool isNewMedicao = true}) {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.MEDICAO_ROUTER}${RouterConst.CREATE_MEDICAO_ROUTER}',
        arguments: [medicao, parcelaId]);
  }

  Future<ApiResponse> delete(final String medicaoId) {
    final usecase = Modular.get<IDeleteMedicaoUsecase>();
    return usecase.call(medicaoId);
  }

  void goToArvoreListPage(Medicao medicao) {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.ARVORE_ROUTER}',
        arguments: medicao);
  }
}
