import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/repository/medicao_repository.dart';

abstract class UpdateMedicaoUsecase {
  Future<ApiResponse> call(final Medicao medicao);
}

class UpdateMedicaoUsecaseImpl implements UpdateMedicaoUsecase {
  final MedicaoRepository _repository;

  UpdateMedicaoUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> call(Medicao medicao) {
    return _repository.update(medicao);
  }
}
