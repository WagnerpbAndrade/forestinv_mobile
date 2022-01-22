import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/list_parcela_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/infra/datasource/parcela_datasource.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/errors/error.dart';

class HerokuParcelaDatasourceImpl implements ParcelaDatasource {
  static const String _baseUrl =
      'https://forestinv-api.herokuapp.com/v1/api/parcelas';

  final DioClient dioClient;

  HerokuParcelaDatasourceImpl(this.dioClient);

  @override
  Future<ListParcelaResponse> getParcelasPagination(String projectId) async {
    try {
      final Response response =
          await dioClient.get(_baseUrl, '/projeto/$projectId/page');

      print('Parcela Info: ${response.data}');

      return ListParcelaResponse.fromMap(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }

      throw DatasourceError();
    }
  }
}
