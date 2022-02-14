import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/infra/data_source/regra_consistencia_datasource.dart';

class RegraConsistenciaDatasourceImpl implements RegraConsistenciaDatasource {
  static const String _baseUrl =
      'https://forestinv-api.herokuapp.com/v1/api/regras';

  final DioClient _dioClient;

  RegraConsistenciaDatasourceImpl(this._dioClient);

  @override
  Future<List<RegraConsistencia>> getAllByUser(String uuid) async {
    try {
      final Response response =
          await _dioClient.get(_baseUrl, '/user?uuid=$uuid');

      print('Regras [getAllByUser] Info: ${response.data}');

      return (response.data as List)
          .map((r) => RegraConsistencia.fromJson(r))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
