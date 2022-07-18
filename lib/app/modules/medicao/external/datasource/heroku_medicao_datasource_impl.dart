import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/list_medicao_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/infra/datasource/medicao_datasource.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/errors/error.dart';

class HerokuMedicaoDatasourceImpl implements MedicaoDatasource {
  static const String _baseUrl =
      'https://forestinv-api.herokuapp.com/v1/api/medicoes';

  final DioClient dioClient;

  HerokuMedicaoDatasourceImpl(this.dioClient);

  @override
  Future<ListMedicaoResponse> getMedicaoPagination(String parcelaId) async {
    try {
      final Response response =
          await dioClient.get(_baseUrl, '/parcela/$parcelaId/page');

      print('Medição Info: ${response.data}');

      return ListMedicaoResponse.fromMap(response.data);
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
  Future<ApiResponse> save(final Medicao medicao) async {
    try {
      final Response response =
          await dioClient.post(_baseUrl, '', medicao.toMap());

      print('Save Medição Info: ${response.data}');
      return ApiResponse.ok(
        result: Medicao.fromMap(response.data),
      );
    } catch (e) {
      print('HerokuMedicaoDatasourceImpl-save: $e');
      return ApiResponse.error(message: 'Oops! ${e.toString()}');
    }
  }

  @override
  Future<ApiResponse> update(final Medicao medicao) async {
    try {
      print('Medição update: ${medicao.toMap()}');
      await dioClient.put(_baseUrl, '', medicao.toMap());
      print('Medição updated successfully');
      return ApiResponse.ok();
    } catch (e) {
      print('HerokuMedicaoDatasourceImpl-update: $e');
      return ApiResponse.error(message: 'Oops! ${e.toString()}');
    }
  }

  @override
  Future<ApiResponse> delete(final String medicaoId) async {
    try {
      await dioClient.delete(_baseUrl, '/$medicaoId');
      print('Medição deleted successfully');
      return ApiResponse.ok();
    } catch (e) {
      print('HerokuMedicaoDatasourceImpl-delete: $e');
      return ApiResponse.error(message: 'Oops! ${e.toString()}');
    }
  }

  @override
  Future<List<Medicao>> listAllByParcela(parcelaId) {
    // TODO: implement listAllByParcela
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getById(String medicaoId) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> obterUltimaMedicaoByParcelaId(
      String parcelaId, final String anoMedicao) {
    // TODO: implement obterUltimaMedicaoByParcelaId
    throw UnimplementedError();
  }
}
