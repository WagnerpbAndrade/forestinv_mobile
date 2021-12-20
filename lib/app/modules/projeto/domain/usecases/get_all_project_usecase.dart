import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class GetAllProjectsUsecase {
  Future<List<Project>> getAll();
}

class GetAllProjectsUsecaseImpl extends GetAllProjectsUsecase {
  final ProjectRepository _repository;

  GetAllProjectsUsecaseImpl(this._repository);
  @override
  Future<List<Project>> getAll() async {
    return _repository.getAll();
  }
}
