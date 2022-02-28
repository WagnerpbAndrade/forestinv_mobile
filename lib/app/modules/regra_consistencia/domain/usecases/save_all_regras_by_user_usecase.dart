import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/repository/regra_consistencia_repository.dart';

abstract class SaveAllRegrasByUserUsecase {
  Future<ApiResponse> saveAll(final List<RegraConsistencia> regras);
}

class SaveAllRegrasByUserUsecaseImpl implements SaveAllRegrasByUserUsecase {
  final RegraConsistenciaRepository _repository;

  SaveAllRegrasByUserUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> saveAll(List<RegraConsistencia> regras) {
    return _repository.saveAll(regras);
  }
}
