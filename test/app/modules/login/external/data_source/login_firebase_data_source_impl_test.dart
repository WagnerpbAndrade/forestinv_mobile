import 'package:flutter_test/flutter_test.dart';
import 'package:forestinv_mobile/app/modules/login/external/data_source/login_firebase_data_source_impl.dart';

void main() {
  final datasource = LoginFirebaseDataSourceImpl();
  test('Deve logar usando google sign', () {
    final loginGoogleSignIn = datasource.loginGoogleSignIn();
    print(loginGoogleSignIn.then((value) => value.result));
  });
}
