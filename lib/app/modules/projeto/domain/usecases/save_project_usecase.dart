import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class SaveProjectUsecase {
  Future<ApiResponse> save(Project project);
}

class SaveProjectUsecaseImpl implements SaveProjectUsecase {
  final ProjectRepository repository;

  SaveProjectUsecaseImpl(this.repository);

  @override
  Future<ApiResponse> save(Project project) {
    return repository.save(project);
  }
}
