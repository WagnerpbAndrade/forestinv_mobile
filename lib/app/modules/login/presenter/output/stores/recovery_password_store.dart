import 'package:mobx/mobx.dart';
part 'recovery_password_store.g.dart';

class RecoveryPasswordStore = _RecoveryPasswordStoreBase
    with _$RecoveryPasswordStore;

abstract class _RecoveryPasswordStoreBase with Store {
  @observable
  String textoErroEmail = "";
  @observable
  bool errorEmail = false;
  @observable
  String email = "";

  @action
  bool validarEmail() {
    errorEmail = true;
    if (!email.contains("@") || !email.contains(".com") || email.length <= 3) {
      textoErroEmail = "O email está incorreto";
      return false;
    }
    errorEmail = false;
    textoErroEmail = "";
    return true;
  }
}
