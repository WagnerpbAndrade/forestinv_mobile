import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';

abstract class RegraConsistenciaRepository {
  Future<List<RegraConsistencia>> getAllByUser(final String uuid);

  Future<ApiResponse> saveAll(final List<RegraConsistencia> regras);

  Future<ApiResponse> update(final RegraConsistencia regra);
}
