import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/datasource/projeto_datasource.dart';

class ProjectFirestoreDatasourceImpl implements ProjetoDatasource {
  final FirebaseFirestore _instance;
  final AuthStore _authStore;

  ProjectFirestoreDatasourceImpl(this._instance, this._authStore);

  @override
  Future<bool> delete(String projectId) async {
    try {
      _instance
          .collection(FirebaseFirestoreConstants.COLLECTION_PROJETOS)
          .doc(projectId)
          .delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<List<Project>> getAll() async {
    // print('Entrououou');
    // final List<Project> list = [];
    // final userUuid = _authStore.getUser().uid;
    // final snapshot = await _instance
    //     .collection(FirebaseFirestoreConstants.COLLECTION_PROJETOS)
    //     .where('uuid', isEqualTo: userUuid)
    //     .withConverter<Project>(
    //       fromFirestore: (snapshots, _) => Project.fromMap(snapshots.data()!),
    //       toFirestore: (projeto, _) => projeto.toMap(),
    //     )
    //     .get();
    // snapshot.docs.forEach((doc) {
    //   list.add(doc.data());
    // });
    // print('getAllByUser Info: $list');
    return [];
  }

  @override
  Future<List<Project>> getAllByUser(String uuid) async {
    final List<Project> list = [];
    final userUuid = _authStore.user!.uid;
    final projectsRef = _instance
        .collection(FirebaseFirestoreConstants.COLLECTION_PROJETOS)
        .where('uuid', isEqualTo: userUuid);

    final QuerySnapshot querySnapshot = await projectsRef.get();

    querySnapshot.docs.forEach((doc) {
      final projectId = doc.id;
      final uuid = doc.get('uuid');
      final nome = doc.get('nome');
      final area = doc.get('area');
      final visibilidadeProjetoEnum = doc.get('visibilidadeProjetoEnum');
      final created = doc.get('dataCriacao') as Timestamp;
      final dataCriacao =
          DateTime.fromMicrosecondsSinceEpoch(created.microsecondsSinceEpoch);
      final updated = doc.get('ultimaAtualizacao') as Timestamp;
      final ultimaAtualizacao =
          DateTime.fromMicrosecondsSinceEpoch(updated.microsecondsSinceEpoch);

      final Project projeto = Project(
        id: projectId,
        nome: nome,
        area: area,
        uuid: uuid,
        visibilidadeProjetoEnum: visibilidadeProjetoEnum,
        dataCriacao: dataCriacao,
        ultimaAtualizacao: ultimaAtualizacao,
      );
      print(projeto);

      list.add(projeto);
    });

    print('getAllByUser Info: $list');
    return list;
  }

  @override
  Future<Project> getById(num projectId) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<Project>> getByName(String name) {
    // TODO: implement getByName
    throw UnimplementedError();
  }

  @override
  Future<List<Project>> getByNameAndUser(String name, String uuid) async {
    final List<Project> list = [];
    final projectsRef = _instance
        .collection(FirebaseFirestoreConstants.COLLECTION_PROJETOS)
        .where('nome', arrayContains: '$name')
        .where('uuid', isEqualTo: uuid);

    final QuerySnapshot querySnapshot = await projectsRef.get();

    querySnapshot.docs.forEach((doc) {
      final projectId = doc.id;
      final uuid = doc.get('uuid');
      final nome = doc.get('nome');
      final area = doc.get('area');
      final visibilidadeProjetoEnum = doc.get('visibilidadeProjetoEnum');
      final created = doc.get('dataCriacao') as Timestamp;
      final dataCriacao =
          DateTime.fromMicrosecondsSinceEpoch(created.microsecondsSinceEpoch);
      final updated = doc.get('ultimaAtualizacao') as Timestamp;
      final ultimaAtualizacao =
          DateTime.fromMicrosecondsSinceEpoch(updated.microsecondsSinceEpoch);

      final Project projeto = Project(
        id: projectId,
        nome: nome,
        area: area,
        uuid: uuid,
        visibilidadeProjetoEnum: visibilidadeProjetoEnum,
        dataCriacao: dataCriacao,
        ultimaAtualizacao: ultimaAtualizacao,
      );
      print(projeto);

      list.add(projeto);
    });

    print('getByNameAndUser Info: $list');
    return list;
  }

  @override
  Future<ApiResponse> save(Project project) async {
    try {
      project.dataCriacao = DateTime.now().toUtc();
      project.ultimaAtualizacao = DateTime.now().toUtc();
      _instance
          .collection(FirebaseFirestoreConstants.COLLECTION_PROJETOS)
          .add(project.toMap());

      print('ProjectFirestoreDatasourceImpl-Save: success');
      return ApiResponse.ok();
    } catch (e) {
      print('ProjectFirestoreDatasourceImpl-Save: $e');
      return ApiResponse.error(message: 'Oops! $e');
    }
  }

  @override
  Future<ApiResponse> update(Project project) async {
    try {
      project.ultimaAtualizacao = DateTime.now().toUtc();
      _instance
          .collection(FirebaseFirestoreConstants.COLLECTION_PROJETOS)
          .doc(project.id)
          .set(project.updateToMap(), SetOptions(merge: true));
      print('ProjectFirestoreDatasourceImpl-update');
      return ApiResponse.ok();
    } catch (e) {
      print('ProjectFirestoreDatasourceImpl-update: $e');
      return ApiResponse.error(message: 'Oops! $e');
    }
  }
}
