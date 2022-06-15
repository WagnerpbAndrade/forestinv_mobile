import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/login/infra/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'edit_account_store.g.dart';

class EditAccountStore = _EditAccountStore with _$EditAccountStore;

abstract class _EditAccountStore with Store {
  _EditAccountStore() {
    user = authStore.user!;
    print(user);
    name = user.nome;
  }

  bool isSocialLogin = false;
  late UserModelFirebase user;

  final AuthStore authStore = Modular.get();

  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name.length >= 6;
  String? get nameError {
    if (nameValid || name.isEmpty) {
      return null;
    } else if (name.length < 6) {
      return 'Nome com menos de 6 caracteres';
    } else {
      return 'Campo obrigatório';
    }
  }

  @observable
  String pass1 = '';

  @action
  void setPass1(String value) => pass1 = value;

  @observable
  String pass2 = '';

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get passValid => pass1 == pass2 && (pass1.length >= 6 || pass1.isEmpty);
  String? get passError {
    if (pass1.isNotEmpty && pass1.length < 6) {
      return 'Senha muito curta';
    } else if (pass1 != pass2) {
      return 'Senhas não coincidem';
    }
    return null;
  }

  @computed
  bool get isFormValid => nameValid && passValid;

  @observable
  bool loading = false;

  @computed
  Function? get savePressed => (isFormValid && !loading) ? _save : null;

  @action
  Future<void> _save() async {
    loading = true;

    user.nome = name;

    // if (pass1.isNotEmpty) {
    //   user.password = pass1;
    // } else {
    //   user.password = null;
    // }

    // try {
    //   await UserRepository().save(user);
    //   userManagerStore.setUser(user);
    // } catch (e) {
    //   print(e);
    // }

    loading = false;
  }

  void logout() => authStore.logoutGoogle();
}
