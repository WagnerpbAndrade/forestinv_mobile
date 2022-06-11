import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/repository/medicao_repository.dart';

abstract class GetByIdUsecase {
  Future<ApiResponse> getById(final String medicaoId);
}

class GetByIdUsecaseImpl implements GetByIdUsecase {
  final MedicaoRepository _repository;

  GetByIdUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> getById(String medicaoId) async {
    return _repository.getById(medicaoId);
  }
}
