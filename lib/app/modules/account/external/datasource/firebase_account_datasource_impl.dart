import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/account/infra/datasource/account_datasource.dart';

class FirebaseAccountDatasourceImpl implements AccountDatasource {
  final FirebaseAuth _auth = Modular.get<FirebaseAuth>();

  @override
  Future<ApiResponse> updatePassword(String password) async {
    try {
      final currentUser = _auth.currentUser;
      await currentUser!.updatePassword(password);

      return ApiResponse.ok();
    } catch (error) {
      print('Firebase error $error');
      return ApiResponse.error(message: 'Não foi possível atualizar sua senha');
    }
  }

  @override
  Future<ApiResponse> updateProfileName(String profileName) async {
    try {
      final currentUser = _auth.currentUser;
      await currentUser!.updateDisplayName(profileName);

      return ApiResponse.ok();
    } catch (error) {
      print('Firebase error $error');
      return ApiResponse.error(
          message: 'Não foi possível atualizar o nome da conta');
    }
  }
}
