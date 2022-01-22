import 'package:forestinv_mobile/app/modules/parcela/domain/entities/list_parcela_response.dart';

abstract class ParcelaDatasource {
  Future<ListParcelaResponse> getParcelasPagination(String projectId);
}
