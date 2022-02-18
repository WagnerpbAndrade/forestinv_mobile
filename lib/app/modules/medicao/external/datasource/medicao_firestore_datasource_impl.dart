import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/list_medicao_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/infra/datasource/medicao_datasource.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/errors/error.dart';

class MedicaoFirestoreDatasourceImpl implements MedicaoDatasource {
  static const String _baseUrl =
      'https://forestinv-api.herokuapp.com/v1/api/medicoes';

  final FirebaseFirestore _firestore;
  final DioClient dioClient;

  MedicaoFirestoreDatasourceImpl(this.dioClient, this._firestore);

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
  Future<List<Medicao>> listAllByParcela(dynamic parcelaId) async {
    try {
      final List<Medicao> list = [];
      final medicoesRef = _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_MEDICOES)
          .where('parcelaId', isEqualTo: parcelaId);

      final QuerySnapshot querySnapshot = await medicoesRef.get();

      querySnapshot.docs.forEach((doc) {
        final medicaoId = doc.id;
        final parcelaId = doc.get('parcelaId');
        final nomeResponsavel = doc.get('nomeResponsavel');
        final dataMedicaoTimestamp = doc.get('dataMedicao') as Timestamp;
        final dataMedicao = DateTime.fromMicrosecondsSinceEpoch(
            dataMedicaoTimestamp.microsecondsSinceEpoch);
        final updated = doc.get('ultimaAtualizacao') as Timestamp;
        final ultimaAtualizacao =
            DateTime.fromMicrosecondsSinceEpoch(updated.microsecondsSinceEpoch);

        final Medicao medicao = Medicao(
          id: medicaoId,
          parcelaId: parcelaId,
          nomeResponsavel: nomeResponsavel,
          dataMedicao: dataMedicao,
          ultimaAtualizacao: ultimaAtualizacao,
        );
        list.add(medicao);
      });

      print('listAllByParcela Info: $list');
      return list;
    } catch (e) {
      print('MedicaoFirestoreDatasourceImpl-listAllByParcela: $e');
      rethrow;
    }
  }

  @override
  Future<ApiResponse> save(final Medicao medicao) async {
    try {
      medicao.dataMedicao = DateTime.now();
      medicao.ultimaAtualizacao = DateTime.now();
      await _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_MEDICOES)
          .add(medicao.toMap());
      return ApiResponse.ok();
    } catch (e) {
      print('MedicaoFirestoreDatasourceImpl-save: $e');
      return ApiResponse.error(message: 'Oops! Algo deu errado: $e');
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
}
