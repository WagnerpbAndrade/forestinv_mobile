import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/infra/data_source/regra_consistencia_datasource.dart';

class RegraFirestoreDatasourceImpl implements RegraConsistenciaDatasource {
  final FirebaseFirestore _firestore;

  RegraFirestoreDatasourceImpl(this._firestore);

  @override
  Future<List<RegraConsistencia>> getAllByUser(String uuid) async {
    try {
      final List<RegraConsistencia> list = [];
      final regrasRef = _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_REGRAS)
          .where('uuid', isEqualTo: uuid);

      final QuerySnapshot querySnapshot = await regrasRef.get();

      querySnapshot.docs.forEach((doc) {
        final regraId = doc.id;
        final uuid = doc.get('uuid');
        final descricao = doc.get('descricao');
        final tipo =
            ValidacaoConsistenciaEnum.values.elementAt(doc.get('tipo'));
        final ativoInativoEnum =
            AtivoInativoEnum.values.elementAt(doc.get('ativoInativoEnum'));
        final dataCriacaoTimestamp = doc.get('dataCriacao') as Timestamp;
        final dataCriacao = DateTime.fromMicrosecondsSinceEpoch(
            dataCriacaoTimestamp.microsecondsSinceEpoch);
        final updated = doc.get('ultimaAtualizacao') as Timestamp;
        final ultimaAtualizacao =
            DateTime.fromMicrosecondsSinceEpoch(updated.microsecondsSinceEpoch);

        final regra = RegraConsistencia(
          id: regraId,
          uuid: uuid,
          descricao: descricao,
          tipo: tipo,
          ativoInativoEnum: ativoInativoEnum,
          dataCriacao: dataCriacao,
          ultimaAtualizacao: ultimaAtualizacao,
        );
        list.add(regra);
      });

      print('RegraFirestoreDatasourceImpl-getAllByUser: $list');
      return list;
    } catch (e) {
      print('RegraFirestoreDatasourceImpl-getAllByUser: $e');
      rethrow;
    }
  }

  @override
  Future<ApiResponse> saveAll(List<RegraConsistencia> regras) async {
    try {
      regras.forEach((regra) {
        _firestore
            .collection(FirebaseFirestoreConstants.COLLECTION_REGRAS)
            .add(regra.toJson());
      });

      return ApiResponse.ok();
    } catch (e) {
      print('RegraFirestoreDatasourceImpl-save: $e');
      return ApiResponse.error(message: 'Oops! Algo deu errado: $e');
    }
  }

  @override
  Future<ApiResponse> update(RegraConsistencia regra) async {
    try {
      _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_REGRAS)
          .doc(regra.id)
          .set(regra.updateToJson(), SetOptions(merge: true));
      return ApiResponse.ok();
    } catch (e) {
      print('RegraFirestoreDatasourceImpl-update: $e');
      return ApiResponse.error(message: 'Oops! Algo deu errado: $e');
    }
  }

  Future<ApiResponse> regraEstaAtiva({
    required final String uuid,
    required final ValidacaoConsistenciaEnum validacao,
  }) async {
    try {
      final regraRef = _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_REGRAS)
          .where('uuid', isEqualTo: uuid)
          .where('tipo', isEqualTo: validacao.index);

      final snapshot = await regraRef.get();

      if (snapshot.size == 0) {
        return ApiResponse.error(
            message: 'Nenhuma regra de consistência encontrada.');
      }

      final regraId = snapshot.docs.first.id;
      final ativo = AtivoInativoEnum.values
          .elementAt(snapshot.docs.first.get('ativoInativoEnum'));
      final tipo = ValidacaoConsistenciaEnum.values
          .elementAt(snapshot.docs.first.get('tipo'));
      final uuidResponse = snapshot.docs.first.get('uuid');
      final descricao = snapshot.docs.first.get('descricao');
      final dataCriacaoTimestamp =
          snapshot.docs.first.get('dataCriacao') as Timestamp;
      final dataCriacao = DateTime.fromMicrosecondsSinceEpoch(
          dataCriacaoTimestamp.microsecondsSinceEpoch);
      final updated = snapshot.docs.first.get('ultimaAtualizacao') as Timestamp;
      final ultimaAtualizacao =
          DateTime.fromMicrosecondsSinceEpoch(updated.microsecondsSinceEpoch);

      final regra = RegraConsistencia(
        id: regraId,
        ativoInativoEnum: ativo,
        tipo: tipo,
        descricao: descricao,
        uuid: uuidResponse,
        dataCriacao: dataCriacao,
        ultimaAtualizacao: ultimaAtualizacao,
      );

      final isActive = regra.isActive();

      print('RegraFirestoreDatasourceImpl-regraEstaAtiva: $isActive');
      return ApiResponse.ok(result: isActive);
    } catch (e) {
      print('Error => RegraFirestoreDatasourceImpl-regraEstaAtiva: $e');
      return ApiResponse.error();
    }
  }
}
