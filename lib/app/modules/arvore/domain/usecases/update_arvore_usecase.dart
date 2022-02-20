import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/repository/arvore_repository.dart';

abstract class UpdateArvoreUsecase {
  Future<ApiResponse> update(Arvore arvore);
}

class UpdateArvoreUsecaseImpl implements UpdateArvoreUsecase {
  final ArvoreRepository _repository;

  UpdateArvoreUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> update(Arvore arvore) async {
    return _repository.update(arvore);
  }
}
