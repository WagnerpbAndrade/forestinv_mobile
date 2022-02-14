import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';

abstract class RegraConsistenciaDatasource {
  Future<List<RegraConsistencia>> getAllByUser(final String uuid);
}
