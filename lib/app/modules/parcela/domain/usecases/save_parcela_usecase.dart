import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/repository/parcela_repository.dart';

abstract class SaveParcelaUsecase {
  Future<ApiResponse> call(Parcela parcela);
}

class SaveParcelaUsecaseImpl implements SaveParcelaUsecase {
  final ParcelaRepository _repository;

  SaveParcelaUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> call(Parcela parcela) {
    return _repository.save(parcela);
  }
}
