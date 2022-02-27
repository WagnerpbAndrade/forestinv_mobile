import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/repository/medicao_repository.dart';

abstract class DeleteMedicaoUsecase {
  Future<ApiResponse> call(final String medicaoId);
}

class DeleteMedicaoUsecaseImpl implements DeleteMedicaoUsecase {
  final MedicaoRepository _repository;

  DeleteMedicaoUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> call(String medicaoId) {
    return _repository.delete(medicaoId);
  }
}
