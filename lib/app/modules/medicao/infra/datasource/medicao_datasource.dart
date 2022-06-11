import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/list_medicao_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';

abstract class MedicaoDatasource {
  Future<ListMedicaoResponse> getMedicaoPagination(String parcelaId);

  Future<ApiResponse> getById(final String medicaoId);

  Future<ApiResponse> save(final Medicao medicao);

  Future<ApiResponse> update(final Medicao medicao);

  Future<ApiResponse> delete(final String medicaoId);

  Future<List<Medicao>> listAllByParcela(dynamic parcelaId);
}
