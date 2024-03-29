import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/list_parcela_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';

abstract class ParcelaRepository {
  Future<ListParcelaResponse> getParcelasPagination(String projectId);

  Future<ApiResponse> getById(final String parcelaId);

  Future<ApiResponse> save(Parcela parcela);

  Future<ApiResponse> update(Parcela parcela);

  Future<ApiResponse> delete(final String parcelaId);

  Future<List<Parcela>> listAllByProject(dynamic projectId);
}
