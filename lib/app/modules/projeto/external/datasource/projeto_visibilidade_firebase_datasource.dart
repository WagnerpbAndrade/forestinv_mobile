import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/visibilidade.dart';

class ProjetoVisibilidadeFirebaseDatasource {
  final FirebaseFirestore _firestore;

  ProjetoVisibilidadeFirebaseDatasource(this._firestore);

  Future<List<Visibilidade>> getAll() async {
    final List<Visibilidade> list = [];
    final visibilidadeRef = _firestore
        .collection(FirebaseFirestoreConstants.COLLECTION_VISIBILIDADE_PROJETO);

    final QuerySnapshot querySnapshot = await visibilidadeRef.get();

    querySnapshot.docs.forEach((doc) {
      final visibilidadeId = doc.id;
      final description = doc.get('visibilidade');

      final visibilidade = Visibilidade(
        id: visibilidadeId,
        description: description,
      );
      print(visibilidade);

      list.add(visibilidade);
    });

    print('ProjetoVisibilidadeFirebaseDatasource-getAll: $list');
    return list;
  }
}
