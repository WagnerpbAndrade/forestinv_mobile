import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/repository/medicao_repository.dart';

abstract class ListAllMedicaoByParcela {
  Future<List<Medicao>> listAllByParcela(dynamic parcelaId);
}

class ListAllMedicaoByParcelaImpl implements ListAllMedicaoByParcela {
  final MedicaoRepository _repository;

  ListAllMedicaoByParcelaImpl(this._repository);

  @override
  Future<List<Medicao>> listAllByParcela(dynamic parcelaId) {
    return _repository.listAllByParcela(parcelaId);
  }
}
