import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/repository/parcela_repository.dart';

abstract class ListAllParcelaByProjeto {
  Future<List<Parcela>> call(dynamic projectId);
}

class ListAllParcelaByProjetoImpl implements ListAllParcelaByProjeto {
  final ParcelaRepository _repository;

  ListAllParcelaByProjetoImpl(this._repository);

  @override
  Future<List<Parcela>> call(projectId) {
    return _repository.listAllByProject(projectId);
  }
}
