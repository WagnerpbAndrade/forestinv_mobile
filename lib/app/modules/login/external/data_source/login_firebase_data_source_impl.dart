import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/login/domain/entities/sign_up_entity.dart';
import 'package:forestinv_mobile/app/modules/login/infra/data_source/login_firebase_data_source.dart';
import 'package:forestinv_mobile/app/modules/login/infra/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginFirebaseDataSourceImpl implements LoginFirebaseDatasource {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = Modular.get<FirebaseAuth>();

  @override
  Future<ApiResponse> loginGoogleSignIn() async {
    try {
      //Login com o Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      print('Google User: ${googleUser.email}');

      // Credenciais para o Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Login no Firebase
      final userCredential = await _auth.signInWithCredential(credential);
      final User user = userCredential.user!;
      print('Firebase Nome: ${user.displayName}');
      print('Firebase Email: ${user.email}');
      print('Firebase Foto: ${user.photoURL}');

      return ApiResponse.ok();
    } catch (error) {
      print('Firebase error $error');
      return ApiResponse.error(message: 'Não foi possível fazer o login');
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Future<ApiResponse> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      print('User Credential: $user');

      if (user != null) {
        final UserModelFirebase userModelFirebase =
            UserModelFirebase.fromJson(user);

        return ApiResponse.ok(result: userModelFirebase);
      }

      return ApiResponse.error(message: 'Usuário/senha incorreto(a)');
    } catch (e) {
      print('LoginFirebaseDataSourceImpl-loginWithEmailAndPassword: $e');
      return ApiResponse.error(message: 'Não foi possível fazer o login');
    }
  }

  @override
  Future<ApiResponse> recoverPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return ApiResponse.ok(message: 'Email enviado com sucesso!');
    } catch (e) {
      print('LoginFirebaseDataSourceImpl-recoverPassword: $e');
      return ApiResponse.error(
          message: 'Não foi possível enviar o email. Tente novamente.');
    }
  }

  @override
  Future<ApiResponse> createUser(final SignUpEntity signUp) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: signUp.email,
        password: signUp.password,
      )
          .then((result) {
        result.user!.updateDisplayName(signUp.name);
        return result;
      });

      await userCredential.user!.updateDisplayName(signUp.name);

      final User? user = userCredential.user;
      if (user != null) {
        final UserModelFirebase userModelFirebase = UserModelFirebase(
          email: user.email,
          nome: user.displayName ?? '',
          uid: user.uid,
          photoUrl: '',
        );
        return ApiResponse.ok(result: userModelFirebase);
      }
      return ApiResponse.error(
          message: 'Não foi possível criar sua conta. Tente novamente!');
    } catch (e) {
      print('LoginFirebaseDataSourceImpl-createUser: $e');
      return ApiResponse.error(
          message: 'Não foi possível criar sua conta. Tente novamente!');
    }
  }

  @override
  Future<UserModelFirebase?> currentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      final UserModelFirebase userModelFirebase =
          UserModelFirebase.fromJson(user);

      return userModelFirebase;
    }
    return null;
  }
}
