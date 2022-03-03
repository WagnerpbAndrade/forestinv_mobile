import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/get_all_regras_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/save_all_regras_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/update_regra_usecase.dart';
import 'package:mobx/mobx.dart';

part 'regra_consistencia_store.g.dart';

class RegraConsistenciaStore = _RegraConsistenciaStoreBase
    with _$RegraConsistenciaStore;

abstract class _RegraConsistenciaStoreBase with Store {
  _RegraConsistenciaStoreBase() {
    autorun((_) async {
      setLoading(true);

      try {
        _fetchRegras();
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<RegraConsistencia> regraList =
      ObservableList<RegraConsistencia>();

  @action
  void addNewRegras(List<RegraConsistencia> newRegras) {
    regraList.clear();
    regraList.addAll(newRegras);
  }

  @observable
  String? error;

  @action
  void setError(String? value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @computed
  bool get showProgress => loading && regraList.isEmpty;

  Future<void> _fetchRegras() async {
    final usecase = Modular.get<GetAllRegrasByUserUsecase>();
    final auth = Modular.get<AuthStore>();

    if (auth.isLoggedIn) {
      final list = await usecase.getAllByUser(
        auth.user!.uid,
      );

      addNewRegras(list);
    }
  }

  void refresh() => _fetchRegras();

  Future<void> salveAllRegrasByUser(final dynamic uuid) async {
    final usecase = Modular.get<SaveAllRegrasByUserUsecase>();

    try {
      await usecase
          .saveAll(RegraConsistencia.createListWithRegrasConsistencia(uuid));
    } catch (e) {
      print('RegraConsistenciaStore - Erro ao salver regras por usuário: $e');
    }
  }

  void updateStatus(
      final RegraConsistencia regra, final AtivoInativoEnum status) {
    final usecase = Modular.get<UpdateRegraUsecase>();

    regra.ativoInativoEnum = status;
    regra.ultimaAtualizacao = DateTime.now();

    usecase.update(regra);

    refresh();
  }
}
