import 'package:forestinv_mobile/app/modules/medicao/domain/entities/list_medicao_response.dart';

abstract class MedicaoRepository {
  Future<ListMedicaoResponse> getMedicaoPagination(String parcelaId);
}
