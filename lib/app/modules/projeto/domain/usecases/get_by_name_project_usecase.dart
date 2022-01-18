import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class GetByNameProjectUsecase {
  Future<List<Project>> getByName(String name);
}

class GetByNameProjectUsecaseImpl implements GetByNameProjectUsecase {
  final ProjectRepository repository;

  GetByNameProjectUsecaseImpl(this.repository);

  @override
  Future<List<Project>> getByName(String name) async {
    return repository.getByName(name);
  }
}
