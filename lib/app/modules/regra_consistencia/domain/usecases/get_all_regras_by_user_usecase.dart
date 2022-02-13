import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/repository/regra_consistencia_repository.dart';

abstract class GetAllRegrasByUserUsecase {
  Future<ApiResponse> getAllByUser(final String uuid);
}

class GetAllRegrasByUserUsecaseImpl implements GetAllRegrasByUserUsecase {
  final RegraConsistenciaRepository _repository;

  GetAllRegrasByUserUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> getAllByUser(String uuid) {
    return _repository.getAllByUser(uuid);
  }
}
