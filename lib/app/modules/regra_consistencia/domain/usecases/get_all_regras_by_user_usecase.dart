import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/repository/regra_consistencia_repository.dart';

abstract class GetAllRegrasByUserUsecase {
  Future<List<RegraConsistencia>> getAllByUser(final String uuid);
}

class GetAllRegrasByUserUsecaseImpl implements GetAllRegrasByUserUsecase {
  final RegraConsistenciaRepository _repository;

  GetAllRegrasByUserUsecaseImpl(this._repository);

  @override
  Future<List<RegraConsistencia>> getAllByUser(String uuid) {
    return _repository.getAllByUser(uuid);
  }
}
