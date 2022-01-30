import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';

abstract class ProjetoDatasource {
  Future<List<Project>> getAll();

  Future<Project> save(Project project);

  Future<Project> update(Project project);

  Future<bool> delete(String projectId);

  Future<Project> getById(num projectId);

  Future<List<Project>> getByName(String name);
}
