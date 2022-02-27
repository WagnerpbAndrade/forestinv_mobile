import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/list_parcela_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/infra/datasource/parcela_datasource.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/stores/cadastrar_parcela_store.dart';

class ParcelaFirestoreDatasourceImpl implements ParcelaDatasource {
  final FirebaseFirestore _firestore;

  ParcelaFirestoreDatasourceImpl(this._firestore);

  @override
  Future<ApiResponse> delete(String parcelaId) async {
    try {
      await _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_PARCELAS)
          .doc(parcelaId)
          .delete();
      return ApiResponse.ok(result: true);
    } catch (e) {
      print(e);
      print('ParcelaFirestoreDatasourceImpl-delete: $e');
      return ApiResponse.error(message: 'Oops! Algo deu errado: $e');
    }
  }

  @override
  Future<ListParcelaResponse> getParcelasPagination(String projectId) {
    // TODO: implement getParcelasPagination
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> save(Parcela parcela) async {
    try {
      parcela.dataCriacao = DateTime.now();
      parcela.ultimaAtualizacao = DateTime.now();
      await _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_PARCELAS)
          .add(parcela.toMap());
      return ApiResponse.ok();
    } catch (e) {
      print('ParcelaFirestoreDatasourceImpl-save: $e');
      return ApiResponse.error(message: 'Oops! Algo deu errado: $e');
    }
  }

  @override
  Future<ApiResponse> update(Parcela parcela) async {
    try {
      parcela.ultimaAtualizacao = DateTime.now().toUtc();
      await _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_PARCELAS)
          .doc(parcela.id)
          .set(parcela.updateToMap(), SetOptions(merge: true));
      return ApiResponse.ok();
    } catch (e) {
      print('ParcelaFirestoreDatasourceImpl-update: $e');
      return ApiResponse.error(message: 'Oops! Algo deu errado: $e');
    }
  }

  @override
  Future<List<Parcela>> listAllByProject(dynamic projectId) async {
    final cadastrarParcelaStore = Modular.get<CadastrarParcelaStore>();
    try {
      final List<Parcela> list = [];
      final parcelasRef = _firestore
          .collection(FirebaseFirestoreConstants.COLLECTION_PARCELAS)
          .where('projetoId', isEqualTo: projectId);

      final QuerySnapshot querySnapshot = await parcelasRef.get();

      querySnapshot.docs.forEach((doc) {
        final parcelaId = doc.id;
        final area = doc.get('area');
        final largura = doc.get('largura');
        final numero = doc.get('numero');
        final espacamento = doc.get('espacamento');
        final latitude = doc.get('latitude');
        final longitude = doc.get('longitude');
        final numTalhao = doc.get('numTalhao');
        final tipoParcelaEnum = doc.get('tipoParcelaEnum');
        final created = doc.get('dataCriacao') as Timestamp;
        final dataCriacao =
            DateTime.fromMicrosecondsSinceEpoch(created.microsecondsSinceEpoch);
        final updated = doc.get('ultimaAtualizacao') as Timestamp;
        final ultimaAtualizacao =
            DateTime.fromMicrosecondsSinceEpoch(updated.microsecondsSinceEpoch);
        final dataPlantioTimestamp = doc.get('dataPlantio') as Timestamp;
        final dataPlantio = DateTime.fromMicrosecondsSinceEpoch(
            dataPlantioTimestamp.microsecondsSinceEpoch);

        final idadeParcela =
            cadastrarParcelaStore.calcularIdadeParcela(dataPlantio);

        final Parcela parcela = Parcela(
          id: parcelaId,
          area: area,
          largura: largura,
          numero: numero,
          numTalhao: numTalhao,
          espacamento: espacamento,
          dataPlantio: dataPlantio,
          idadeParcela: idadeParcela,
          latitude: latitude,
          longitude: longitude,
          tipoParcelaEnum: tipoParcelaEnum,
          dataCriacao: dataCriacao,
          ultimaAtualizacao: ultimaAtualizacao,
        );
        update(parcela);

        list.add(parcela);
      });

      print('ParcelaFirestoreDatasourceImpl-listAllByProject: $list');
      return list;
    } catch (e) {
      print('ParcelaFirestoreDatasourceImpl-listAllByProject: $e');
      rethrow;
    }
  }
}
