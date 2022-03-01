import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/estado_arvore.dart';

class EstadoArvoreFirebaseDatasource {
  final FirebaseFirestore _firestore;

  EstadoArvoreFirebaseDatasource(this._firestore);

  Future<List<EstadoArvore>> getAll() async {
    final List<EstadoArvore> list = [];
    final estadoRef = _firestore
        .collection(FirebaseFirestoreConstants.COLLECTION_ESTADOS_ARVORE)
        .orderBy('index', descending: false);

    final QuerySnapshot querySnapshot = await estadoRef.get();

    querySnapshot.docs.forEach((doc) {
      final estadoId = doc.id;
      final description = doc.get('estado');
      final index = doc.get('index');

      final estado = EstadoArvore(
        id: estadoId,
        description: description,
        index: index,
      );

      list.add(estado);
    });

    print('EstadoArvoreFirebaseDatasource-getAll: $list');
    return list;
  }
}
