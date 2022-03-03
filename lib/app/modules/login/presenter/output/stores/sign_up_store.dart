import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/login/domain/entities/sign_up_entity.dart';
import 'package:forestinv_mobile/app/modules/login/domain/usecase/sign_up_usecase.dart';
import 'package:forestinv_mobile/app/modules/login/infra/models/user_model.dart';
import 'package:forestinv_mobile/helper/extensions.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length > 6;
  String? get nomeError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
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

  @observable
  String? phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;
  String? get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  @observable
  String? pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1!.length >= 6;
  String? get pass1Error {
    if (pass1 == null || pass1Valid) {
      return null;
    } else if (pass1!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha muito curta';
    }
  }

  @observable
  String? pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;
  String? get pass2Error {
    if (pass2 == null || pass2Valid) {
      return null;
    } else {
      return 'Senhas não coincidem';
    }
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && pass1Valid && pass2Valid;

  @computed
  Function? get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  setError(String value) => error = value;

  @action
  Future<void> _signUp() async {
    loading = true;
    final usecase = Modular.get<SignUpUsecase>();

    final signUpEntity = SignUpEntity(
        name: name!, email: email!, phone: phone!, password: pass1!);

    final apiResponse = await usecase.createUser(signUpEntity);

    if (apiResponse.ok) {
      //final regraStore = Modular.get<RegraConsistenciaStore>();
      final UserModelFirebase user = apiResponse.result;
      final auth = Modular.get<AuthStore>();
      auth.setUser(user);
      //await regraStore.salveAllRegrasByUser(user.uid);
      //Modular.to.pop();
    } else {
      setError(apiResponse.message!);
    }

    loading = false;
  }
}
