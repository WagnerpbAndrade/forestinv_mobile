import 'package:forestinv_mobile/app/modules/parcela/domain/entities/list_parcela_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/repository/parcela_repository.dart';

abstract class GetAllParcelaByProject {
  Future<ListParcelaResponse> getParcelasPagination(String projectId);
}

class GetAllParcelaByProjectImpl implements GetAllParcelaByProject {
  final ParcelaRepository repository;

  GetAllParcelaByProjectImpl(this.repository);

  @override
  Future<ListParcelaResponse> getParcelasPagination(String projectId) {
    return repository.getParcelasPagination(projectId);
  }
}
