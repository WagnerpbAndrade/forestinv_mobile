import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/list_parcela_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';

abstract class ParcelaRepository {
  Future<ListParcelaResponse> getParcelasPagination(String projectId);

  Future<ApiResponse> save(Parcela parcela);
}
