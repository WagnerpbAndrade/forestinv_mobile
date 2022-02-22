import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/delete_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/get_all_by_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/save_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/create_arvore_story.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';

class ArvoreController {
  Future<List<Arvore>> getAllArvoresByMedicao(String medicaoId) async {
    final usecase = Modular.get<GetAllByMedicaoUsecase>();
    try {
      return usecase.getAllByMedicao(medicaoId);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> delete(final dynamic arvoreId) async {
    final usecase = Modular.get<DeleteArvoreUsecase>();
    return usecase.delete(arvoreId);
  }

  void goToMedicaoPage(Medicao medicao) {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.MEDICAO_ROUTER}${RouterConst.ARVORE_ROUTER}',
        arguments: medicao);
  }

  void goToCreateArvorePage(final Arvore? arvore, final String? medicaoId,
      {final bool isNewMedicao = true}) {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.ARVORE_ROUTER}${RouterConst.CREATE_ARVORE_ROUTER}',
        arguments: [arvore, medicaoId]);
  }
}