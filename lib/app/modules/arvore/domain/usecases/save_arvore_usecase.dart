import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/repository/arvore_repository.dart';

abstract class SaveArvoreUsecase {
  Future<ApiResponse> save(final Arvore arvore);
}

class SaveArvoreUsecaseImpl implements SaveArvoreUsecase {
  final ArvoreRepository _repository;

  SaveArvoreUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> save(Arvore arvore) async {
    return _repository.save(arvore);
  }
}
