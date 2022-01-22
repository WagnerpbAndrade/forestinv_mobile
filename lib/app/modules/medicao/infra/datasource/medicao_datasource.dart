import 'package:forestinv_mobile/app/modules/medicao/domain/entities/list_medicao_response.dart';

abstract class MedicaoDatasource {
  Future<ListMedicaoResponse> getMedicaoPagination(String parcelaId);
}
