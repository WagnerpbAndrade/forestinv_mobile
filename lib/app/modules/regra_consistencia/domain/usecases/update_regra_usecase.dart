import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/repository/regra_consistencia_repository.dart';

abstract class UpdateRegraUsecase {
  Future<ApiResponse> update(final RegraConsistencia regra);
}

class UpdateRegraUsecaseImpl implements UpdateRegraUsecase {
  final RegraConsistenciaRepository _repository;

  UpdateRegraUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> update(RegraConsistencia regra) {
    return _repository.update(regra);
  }
}
