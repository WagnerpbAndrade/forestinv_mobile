import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/infra/datasource/arvore_datasource.dart';

class ArvoreFirestoreDatasourceImpl implements ArvoreDatasource {
  final FirebaseFirestore _firestore;

  ArvoreFirestoreDatasourceImpl(this._firestore);
  @override
  Future<ApiResponse> delete(String arvoreId) async {
    try {
      _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_ARVORES)
          .doc(arvoreId)
          .delete();
      return ApiResponse.ok(result: true);
    } catch (e) {
      print(e);
      print('ArvoreFirestoreDatasourceImpl-delete: $e');
      return ApiResponse.error(message: 'Oops! Algo deu errado: $e');
    }
  }

  @override
  Future<List<Arvore>> getAllByMedicao(dynamic medicaoId) async {
    try {
      final List<Arvore> list = [];
      final arvoresRef = _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_ARVORES)
          .where('medicaoId', isEqualTo: medicaoId);

      final QuerySnapshot querySnapshot = await arvoresRef.get();

      querySnapshot.docs.forEach((doc) {
        final arvoreId = doc.id;
        final medicaoId = doc.get('medicaoId');
        final numArvore = doc.get('numArvore');
        final dap = doc.get('dap');
        final alturaTotal = doc.get('alturaTotal');
        final latitude = doc.get('latitude');
        final longitude = doc.get('longitude');
        final estadoArvore = doc.get('estadoArvore');
        final observacao = doc.get('observacao');

        final Arvore arvore = Arvore(
          id: arvoreId,
          medicaoId: medicaoId,
          numArvore: numArvore,
          dap: dap,
          alturaTotal: alturaTotal,
          latitude: latitude,
          longitude: longitude,
          estadoArvore: estadoArvore,
          observacao: observacao,
        );
        list.add(arvore);
      });

      print('ArvoreFirestoreDatasourceImpl-getAllByMedicao: $list');
      return list;
    } catch (e) {
      print('ArvoreFirestoreDatasourceImpl-getAllByMedicao: $e');
      rethrow;
    }
  }

  @override
  Future<ApiResponse> save(Arvore arvore) async {
    try {
      _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_ARVORES)
          .add(arvore.createToMap());
      return ApiResponse.ok();
    } catch (e) {
      print('ArvoreFirestoreDatasourceImpl-save: $e');
      return ApiResponse.error(message: 'Oops! Algo deu errado: $e');
    }
  }

  @override
  Future<ApiResponse> update(Arvore arvore) async {
    try {
      _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_ARVORES)
          .doc(arvore.id)
          .set(arvore.updateToMap(), SetOptions(merge: true));
      return ApiResponse.ok();
    } catch (e) {
      print('ArvoreFirestoreDatasourceImpls-update: $e');
      return ApiResponse.error(message: 'Oops! Algo deu errado: $e');
    }
  }
}
