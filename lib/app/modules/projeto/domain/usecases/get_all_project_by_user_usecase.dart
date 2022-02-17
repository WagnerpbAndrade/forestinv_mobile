import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';

abstract class GetAllProjectByUserUsecase {
  Future<List<Project>> getAllByUser(final String uuid);
}

class GetAllProjectByUserUsecaseImpl extends GetAllProjectByUserUsecase {
  final ProjectRepository _repository;

  GetAllProjectByUserUsecaseImpl(this._repository);
  @override
  Future<List<Project>> getAllByUser(final String uuid) async {
    return _repository.getAllByUser(uuid);
  }
}
