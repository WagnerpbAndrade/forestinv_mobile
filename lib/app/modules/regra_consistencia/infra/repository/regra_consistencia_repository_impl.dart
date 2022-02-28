import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/repository/regra_consistencia_repository.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/infra/data_source/regra_consistencia_datasource.dart';

class RegraConsistenciaRepositoryImpl implements RegraConsistenciaRepository {
  final RegraConsistenciaDatasource _datasource;

  RegraConsistenciaRepositoryImpl(this._datasource);

  @override
  Future<List<RegraConsistencia>> getAllByUser(String uuid) {
    return _datasource.getAllByUser(uuid);
  }

  @override
  Future<ApiResponse> saveAll(List<RegraConsistencia> regras) {
    return _datasource.saveAll(regras);
  }

  @override
  Future<ApiResponse> update(RegraConsistencia regra) {
    return _datasource.update(regra);
  }
}
