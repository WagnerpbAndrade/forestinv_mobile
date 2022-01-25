import 'package:forestinv_mobile/app/modules/parcela/domain/entities/list_parcela_response.dart';

abstract class ParcelaRepository {
  Future<ListParcelaResponse> getParcelasPagination(String projectId);
}