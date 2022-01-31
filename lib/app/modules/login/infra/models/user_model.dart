import 'package:forestinv_mobile/app/modules/login/domain/entities/user.dart';

class UserModelFirebase extends User {
  UserModelFirebase(
      {required email, required nome, required photoUrl, required uid})
      : super(email: email, nome: nome, photoUrl: photoUrl, uid: uid);

  factory UserModelFirebase.fromJson(Map<String, dynamic> json) =>
      UserModelFirebase(
        nome: json['nome'],
        email: json['email'],
        uid: json['uid'],
        photoUrl: json['photoUrl'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['email'] = email;
    data['uid'] = uid;
    data['photoUrl'] = photoUrl;
    return data;
  }
}
