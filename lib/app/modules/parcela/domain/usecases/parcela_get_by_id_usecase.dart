import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/repository/parcela_repository.dart';

abstract class ParcelaGetByIdUsecase {
  Future<ApiResponse> getById(final String parcelaId);
}

class ParcelaGetByIdUsecaseImpl implements ParcelaGetByIdUsecase {
  final ParcelaRepository _repository;

  ParcelaGetByIdUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> getById(String parcelaId) async {
    return _repository.getById(parcelaId);
  }
}
