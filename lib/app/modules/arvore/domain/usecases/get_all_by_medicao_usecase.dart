import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/repository/arvore_repository.dart';

abstract class GetAllByMedicaoUsecase {
  Future<List<Arvore>> getAllByMedicao(dynamic medicaoId);
}

class GetAllByMedicaoUsecaseImpl implements GetAllByMedicaoUsecase {
  final ArvoreRepository _repository;

  GetAllByMedicaoUsecaseImpl(this._repository);

  @override
  Future<List<Arvore>> getAllByMedicao(dynamic medicaoId) async {
    return _repository.getAllByMedicao(medicaoId);
  }
}
