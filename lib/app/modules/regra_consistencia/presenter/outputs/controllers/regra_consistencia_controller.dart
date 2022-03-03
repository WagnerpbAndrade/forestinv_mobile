import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/checkbox_state.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/get_all_regras_by_user_usecase.dart';
import 'package:mobx/mobx.dart';

class RegraConsistenciaController {
  final List<CheckboxState> rulesList = [];
  final ObservableList<CheckboxState> rules = ObservableList<CheckboxState>();
  final CheckboxState allRules =
      CheckboxState(title: 'Habilitar todas as regras');

  Future<List<RegraConsistencia>> getAllRegrasByUser() {
    final usecase = Modular.get<GetAllRegrasByUserUsecase>();
    final auth = Modular.get<AuthStore>();
    final uuid = auth.user!.uid;

    return usecase.getAllByUser(uuid);
  }

  void setRules(List<RegraConsistencia> regras) {
    regras.forEach((rule) {
      rulesList.add(CheckboxState(
          title: rule.descricao!, value: rule.ativoInativoEnum == 'SIM'));
    });
  }
}
