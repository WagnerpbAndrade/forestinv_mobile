import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class UpdateProjectUsecase {
  Future<ApiResponse> update(Project project);
}

class UpdateProjectUsecaseImpl implements UpdateProjectUsecase {
  final ProjectRepository repository;

  UpdateProjectUsecaseImpl(this.repository);

  @override
  Future<ApiResponse> update(Project project) {
    return repository.update(project);
  }
}
