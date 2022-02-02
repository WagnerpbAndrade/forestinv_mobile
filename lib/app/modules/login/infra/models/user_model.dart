import 'package:firebase_auth/firebase_auth.dart';
import 'package:forestinv_mobile/app/modules/login/domain/entities/usuario.dart';

class UserModelFirebase extends Usuario {
  UserModelFirebase(
      {required email, required nome, required photoUrl, required uid})
      : super(email: email, nome: nome, photoUrl: photoUrl, uid: uid);

  factory UserModelFirebase.fromJson(User? user) => UserModelFirebase(
        nome: user?.displayName == null ? '' : user!.displayName,
        email: user?.email == null ? '' : user!.email,
        uid: user?.uid == null ? '' : user!.uid,
        photoUrl: user?.photoURL == null ? '' : user!.photoURL,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['email'] = email;
    data['uid'] = uid;
    data['photoUrl'] = photoUrl;
    return data;
  }

  @override
  String toString() {
    return 'UID: $uid - Nome: $nome - Email: $email - PhotoUrl: $photoUrl';
  }
}
