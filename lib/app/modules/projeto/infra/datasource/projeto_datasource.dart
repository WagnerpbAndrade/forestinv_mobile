import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';

abstract class ProjetoDatasource {
  Future<List<Project>> getAll();

  Future<Project> save(Project project);

  Future<void> update(Project project);

  Future<void> disable(Project project);

  Future<void> enable(Project project);

  Future<bool> delete(num projectId);

  Future<Project> getById(num projectId);

  Future<List<Project>> getByName(String name);
}
