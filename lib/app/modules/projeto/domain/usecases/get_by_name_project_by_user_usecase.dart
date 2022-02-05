import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class GetByNameProjectAndUserUsecase {
  Future<List<Project>> getByNameAndUser(String name, String uuid);
}

class GetByNameProjectAndUserUsecaseImpl
    implements GetByNameProjectAndUserUsecase {
  final ProjectRepository repository;

  GetByNameProjectAndUserUsecaseImpl(this.repository);

  @override
  Future<List<Project>> getByNameAndUser(String name, String uuid) {
    return repository.getByNameAndUser(name, uuid);
  }
}
