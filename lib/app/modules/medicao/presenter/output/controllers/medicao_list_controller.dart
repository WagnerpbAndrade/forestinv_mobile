import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/get_all_medicao_by_parcela.dart';

class MedicaoListController {
  Future<List<Medicao>> getAllMedicaoByParcela(String parcelaId) async {
    final usecase = Modular.get<GetAllMedicaoByParcela>();
    try {
      final response = await usecase.getMedicaoPagination(parcelaId);
      return response.medicoes;
    } catch (e) {
      rethrow;
    }
  }
}
