import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/list_parcela_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
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

  @override
  Future<ApiResponse> save(Parcela parcela) async {
    try {
      final Response response =
          await dioClient.post(_baseUrl, '', parcela.toMap());

      print('Save Parcela Info: ${response.data}');
      return ApiResponse.ok(
        result: Parcela.fromMap(response.data),
      );
    } catch (e) {
      print('HerokuParcelaDatasourceImpl-save: $e');
      return ApiResponse.error(
          message: 'Oops! Algo deu errado. Tente novamente!');
    }
  }

  @override
  Future<ApiResponse> update(Parcela parcela) async {
    try {
      await dioClient.put(_baseUrl, '', parcela.toMap());
      return ApiResponse.ok();
    } catch (e) {
      print('HerokuParcelaDatasourceImpl-update: $e');
      return ApiResponse.error(
          message: 'Oops! Algo deu errado. Tente novamente!');
    }
  }
}
