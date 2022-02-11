import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/repository/medicao_repository.dart';

abstract class SaveMedicaoUsecase {
  Future<ApiResponse> call(final Medicao medicao);
}

class SaveMedicaoUsecaseImpl implements SaveMedicaoUsecase {
  final MedicaoRepository _repository;

  SaveMedicaoUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> call(Medicao medicao) {
    return _repository.save(medicao);
  }
}
