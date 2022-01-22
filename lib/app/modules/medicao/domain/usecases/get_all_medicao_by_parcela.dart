import 'package:forestinv_mobile/app/modules/medicao/domain/entities/list_medicao_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/repository/medicao_repository.dart';

abstract class GetAllMedicaoByParcela {
  Future<ListMedicaoResponse> getMedicaoPagination(String parcelaId);
}

class GetAllMedicaoByParcelaImpl implements GetAllMedicaoByParcela {
  final MedicaoRepository repository;

  GetAllMedicaoByParcelaImpl(this.repository);

  @override
  Future<ListMedicaoResponse> getMedicaoPagination(String parcelaId) {
    return repository.getMedicaoPagination(parcelaId);
  }
}
