import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/repository/parcela_repository.dart';

abstract class UpdateParcelaUsecase {
  Future<ApiResponse> call(final Parcela parcela);
}

class UpdateParcelaUsecaseImpl implements UpdateParcelaUsecase {
  final ParcelaRepository _repository;

  UpdateParcelaUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> call(Parcela parcela) {
    return _repository.update(parcela);
  }
}
