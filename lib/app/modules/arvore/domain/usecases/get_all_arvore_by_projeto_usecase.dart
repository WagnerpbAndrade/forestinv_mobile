import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/repository/arvore_repository.dart';

abstract class GetAllArvoreByProjetoUsecase {
  Future<List<Arvore>> getAllArvoreByProjeto(dynamic projetoId);
}

class GetAllArvoreByProjetoUsecaseImpl implements GetAllArvoreByProjetoUsecase {
  final ArvoreRepository _repository;

  GetAllArvoreByProjetoUsecaseImpl(this._repository);

  @override
  Future<List<Arvore>> getAllArvoreByProjeto(dynamic projetoId) async {
    return _repository.getAllArvoreByProjeto(projetoId);
  }
}
