import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/infra/datasource/arvore_datasource.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';

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
        final parcelaId = doc.get('parcelaId');
        final projetoId = doc.get('projetoId');
        final numArvore = doc.get('numArvore');
        final dap = doc.get('dap');
        final alturaTotal = doc.get('alturaTotal');
        final latitude = doc.get('latitude');
        final longitude = doc.get('longitude');
        final estadoArvore =
            EstadoArvoreEnum.values.elementAt(doc.get('estadoArvore'));
        final estadoDescription = doc.get('estadoDescription');
        final observacao = doc.get('observacao');
        final dataCriacaoTimestamp = doc.get('dataCriacao') as Timestamp;
        final dataCriacao = DateTime.fromMicrosecondsSinceEpoch(
            dataCriacaoTimestamp.microsecondsSinceEpoch);

        final Arvore arvore = Arvore(
          id: arvoreId,
          medicaoId: medicaoId,
          parcelaId: parcelaId,
          projetoId: projetoId,
          numArvore: numArvore,
          dap: double.parse(dap.toString()),
          alturaTotal: double.parse(alturaTotal.toString()),
          latitude: latitude,
          longitude: longitude,
          estadoArvore: estadoArvore,
          estadoDescription: estadoDescription,
          observacao: observacao,
          dataCriacao: dataCriacao,
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

  Future<ApiResponse> obterArvoreAnoAnterior(final Arvore arvore) async {
    try {
      final anoAnterior = arvore.dataCriacao!.year - 1;

      final medicaRef = _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_MEDICOES)
          .where('parcelaId', isEqualTo: arvore.parcelaId)
          .where('anoMedicao', isEqualTo: anoAnterior);

      final snapshotMedicao = await medicaRef.get();

      if (snapshotMedicao.size == 0) {
        return ApiResponse.error(
            message: 'Nenhuma medição encontrada para o ano de $anoAnterior.');
      }

      final medicaoId = snapshotMedicao.docs.first.id;
      final parcelaId = snapshotMedicao.docs.first.get('parcelaId');
      final nomeResponsavel = snapshotMedicao.docs.first.get('nomeResponsavel');
      final anoMedicao = snapshotMedicao.docs.first.get('anoMedicao');
      final dataMedicaoTimestamp =
          snapshotMedicao.docs.first.get('dataMedicao') as Timestamp;
      final dataMedicao = DateTime.fromMicrosecondsSinceEpoch(
          dataMedicaoTimestamp.microsecondsSinceEpoch);
      final updated =
          snapshotMedicao.docs.first.get('ultimaAtualizacao') as Timestamp;
      final ultimaAtualizacao =
          DateTime.fromMicrosecondsSinceEpoch(updated.microsecondsSinceEpoch);

      final medicao = Medicao(
        id: medicaoId,
        parcelaId: parcelaId,
        nomeResponsavel: nomeResponsavel,
        anoMedicao: anoMedicao,
        dataMedicao: dataMedicao,
        ultimaAtualizacao: ultimaAtualizacao,
      );

      final arvoreRef = _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_ARVORES)
          .where("medicaoId", isEqualTo: medicao.id)
          .where("numArvore", isEqualTo: arvore.numArvore);

      final snapshotArvore = await arvoreRef.get();

      if (snapshotArvore.size > 0) {
        final arvoreId = snapshotArvore.docs.first.id;
        final medicaoId = snapshotArvore.docs.first.get('medicaoId');
        final parcelaId = snapshotArvore.docs.first.get('parcelaId');
        final numArvore = snapshotArvore.docs.first.get('numArvore');
        final dap = snapshotArvore.docs.first.get('dap');
        final alturaTotal = snapshotArvore.docs.first.get('alturaTotal');
        final latitude = snapshotArvore.docs.first.get('latitude');
        final longitude = snapshotArvore.docs.first.get('longitude');
        final estadoArvore = EstadoArvoreEnum.values
            .elementAt(snapshotArvore.docs.first.get('estadoArvore'));
        final estadoDescription =
            snapshotArvore.docs.first.get('estadoDescription');
        final observacao = snapshotArvore.docs.first.get('observacao');
        final dataCriacaoTimestamp =
            snapshotArvore.docs.first.get('dataCriacao') as Timestamp;
        final dataCriacao = DateTime.fromMicrosecondsSinceEpoch(
            dataCriacaoTimestamp.microsecondsSinceEpoch);

        final Arvore arvore = Arvore(
          id: arvoreId,
          medicaoId: medicaoId,
          parcelaId: parcelaId,
          numArvore: numArvore,
          dap: double.parse(dap.toString()),
          alturaTotal: double.parse(alturaTotal.toString()),
          latitude: latitude,
          longitude: longitude,
          estadoArvore: estadoArvore,
          estadoDescription: estadoDescription,
          observacao: observacao,
          dataCriacao: dataCriacao,
        );
        return ApiResponse.ok(result: arvore);
      }
      return ApiResponse.error(
          message: 'Nenhuma árvore encontrada para o ano de $anoAnterior.');
    } catch (e) {
      print(
          'Error => ArvoreFirestoreDatasourceImpls-obterArvoreAnoAnterior: $e');
      return ApiResponse.error(message: 'Oops! Algo deu errado: $e');
    }
  }

  Future<bool> arvoreIsExists(
      final String medicaoId, final Arvore arvore) async {
    try {
      final arvoreRef = _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_ARVORES)
          .where('medicaoId', isEqualTo: medicaoId)
          .where('numArvore', isEqualTo: arvore.numArvore);

      final snapshotArvore = await arvoreRef.get();

      if (snapshotArvore.size > 0) {
        return true;
      }

      return false;
    } catch (e) {
      print(
          'Error => ArvoreFirestoreDatasourceImpls-obterArvoreAnoAnterior: $e');
      return false;
    }
  }
}
