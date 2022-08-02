import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/recovery_password_usecase.dart';
import 'package:forestinv_mobile/helper/extensions.dart';
import 'package:mobx/mobx.dart';

part 'recovery_password_store.g.dart';

class RecoveryPasswordStore = _RecoveryPasswordStore
    with _$RecoveryPasswordStore;

abstract class _RecoveryPasswordStore with Store {
  _RecoveryPasswordStore(this.email) {
    this.email = email;
  }

  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();
  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @computed
  Function? get recoverPressed => (emailValid && !loading) ? _recover : null;

  @observable
  bool success = false;

  @action
  void setSuccess(bool value) => success = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  String? error;

  @action
  void setError(String value) => error = value;

  @action
  Future<void> _recover() async {
    setLoading(true);

    final usecase = Modular.get<RecoveryPasswordUsecase>();
    final apiResponse = await usecase.recoveryPassword(email!);
    if (apiResponse.ok) {
      setSuccess(true);
    } else {
      setError(apiResponse.message!);
    }

    setLoading(false);
  }
}
