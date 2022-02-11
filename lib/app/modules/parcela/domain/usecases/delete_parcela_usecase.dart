import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/repository/parcela_repository.dart';

abstract class DeleteParcelaUsecase {
  Future<ApiResponse> call(final parcelaId);
}

class DeleteParcelaUsecaseImpl implements DeleteParcelaUsecase {
  final ParcelaRepository _repository;

  DeleteParcelaUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> call(parcelaId) {
    return _repository.delete(parcelaId);
  }
}
