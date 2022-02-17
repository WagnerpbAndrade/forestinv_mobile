import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/firebase_firestore_constants.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/delete_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_id_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_by_name_project_by_user_usecase.dart';
import 'package:mobx/mobx.dart';

class ProjetoController {
  @observable
  String errorMessage = '';

  @action
  void setErrorMessage(String value) => errorMessage = value;

  @observable
  bool error = false;

  @action
  void setError(bool value) => error = value;

  // Query<Project> getAllProjectByUser() {
  //   final instance = Modular.get<FirebaseFirestore>();
  //   final auth = Modular.get<AuthStore>();
  //   final userUuid = auth.getUser().uid;
  //   return instance
  //       .collection(FirebaseFirestoreConstants.COLLECTION_PROJETOS)
  //       .where('uuid', isEqualTo: userUuid)
  //       .withConverter<Project>(
  //         fromFirestore: (snapshots, _) => Project.fromMap(snapshots.data()!),
  //         toFirestore: (projeto, _) => projeto.toMap(),
  //       );
  // }

  Future<List<Project>> getAllProjectByUser() async {
    final usecase = Modular.get<GetAllProjectByUserUsecase>();
    final auth = Modular.get<AuthStore>();
    final uuid = auth.firebaseAuth.currentUser!.uid;
    try {
      return await usecase.getAllByUser(uuid);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Project>> getProjectsByNameAndUser(String name) {
    final usecase = Modular.get<GetByNameProjectAndUserUsecase>();
    final auth = Modular.get<AuthStore>();
    final uuid = auth.firebaseAuth.currentUser!.uid;
    try {
      return usecase.getByNameAndUser(name, uuid);
    } catch (e) {
      rethrow;
    }
  }

  Future<Project?> getById(num projectId) async {
    final usecase = Modular.get<GetByIdProjectUsecase>();
    try {
      final result = await usecase.getById(projectId);
      if (result.isRight()) {
        return result.fold(
            (l) => throw Exception("Projeto não encontrato"), (r) => r);
      }
    } catch (e) {
      rethrow;
    }
  }

  void deleteProject(String projectId) async {
    final usecase = Modular.get<DeleteProjectUsecase>();
    setError(false);

    final result = await usecase.delete(projectId);
    result.fold(
      (failure) {
        setError(true);
        setErrorMessage(failure.errorMessage);
      },
      (right) {
        setError(false);
        setErrorMessage('Projeto deletado com sucesso');
      },
    );
  }

  void goToParcelaPage(Project project) {
    Modular.to
        .pushNamed('${RouterConst.PROJECT_ROUTER}/parcela', arguments: project);
  }

  void goToNewProject(Project? project) {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.ADD_PROJECT_ROUTER}',
        arguments: project);
  }

  void goToRegrasConsistencia() {
    Modular.to
        .pushNamed('${RouterConst.PROJECT_ROUTER}${RouterConst.REGRAS_ROUTER}');
  }
}
