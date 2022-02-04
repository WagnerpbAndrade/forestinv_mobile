import 'package:firebase_auth/firebase_auth.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/auth/entity/user_logged.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final FirebaseAuth firebaseAuth;

  _AuthStoreBase(this.firebaseAuth);

  bool isLoggedUser() {
    return firebaseAuth.currentUser != null;
  }

  UserLogged getUser() {
    final user = firebaseAuth.currentUser;
    return UserLogged(
      nome: user?.displayName,
      email: user!.email!,
      uid: user.uid,
      photoUrl: user.photoURL,
    );
  }
}
