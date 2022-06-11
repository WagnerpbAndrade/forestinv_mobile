import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class ProjetoGetByIdUsecase {
  Future<ApiResponse> getById(final String projectId);
}

class ProjetoGetByIdUsecaseImpl implements ProjetoGetByIdUsecase {
  final ProjectRepository _repository;

  ProjetoGetByIdUsecaseImpl(this._repository);

  @override
  Future<ApiResponse> getById(final String projectId) async {
    return _repository.getById(projectId);
  }
}
