import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';

abstract class ProjetoDatasource {
  Future<List<Project>> getAll();

  Future<ApiResponse> save(Project project);

  Future<ApiResponse> update(Project project);

  Future<bool> delete(String projectId);

  Future<ApiResponse> getById(final String projectId);

  Future<List<Project>> getByName(String name);

  Future<List<Project>> getAllByUser(String uuid);

  Future<List<Project>> getByNameAndUser(String name, String uuid);
}
