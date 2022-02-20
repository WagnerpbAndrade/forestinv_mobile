import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/repository/arvore_repository.dart';

abstract class DeleteArvoreUsecase {
  Future<ApiResponse> delete(dynamic arvoreId);
}

class DeleteArvoreUsecaseImpl implements DeleteArvoreUsecase {
  final ArvoreRepository _repository;

  DeleteArvoreUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> delete(dynamic arvoreId) async {
    return _repository.delete(arvoreId);
  }
}
