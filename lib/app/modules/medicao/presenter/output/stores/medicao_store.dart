import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/delete_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/list_all_medicao_by_parcela.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/ui/pages/cadastrar_medicao_page.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:mobx/mobx.dart';

part 'medicao_store.g.dart';

class MedicaoStore = _MedicaoStoreBase with _$MedicaoStore;

abstract class _MedicaoStoreBase with Store {
  final Parcela? parcela;

  _MedicaoStoreBase({this.parcela}) {
    autorun((_) async {
      setLoading(true);
      try {
        _fetchMedicoes();
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<Medicao> medicaoList = ObservableList<Medicao>();

  @action
  void addNewMedicoes(List<Medicao> newMedicoes) {
    medicaoList.clear();
    medicaoList.addAll(newMedicoes);
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
  bool get showProgress => loading && medicaoList.isEmpty;

  Future<void> _fetchMedicoes() async {
    final usecase = Modular.get<ListAllMedicaoByParcela>();

    final list = await usecase.listAllByParcela(parcela!.id);

    addNewMedicoes(list);
  }

  void refresh() => _fetchMedicoes();

  @action
  Future<void> deleteMedicao(final dynamic medicaoId) async {
    final usecase = Modular.get<DeleteMedicaoUsecase>();
    loading = true;
    await usecase.call(medicaoId);
    refresh();
  }

  Future<void> goToCadastrarMedicaoPage(final BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CadastrarMedicaoPage(
          args: [null, parcela!.id],
        ),
      ),
    );
    if (success != null && success) refresh();
  }

  void goToArvorePage(final Medicao medicao) {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.ARVORE_ROUTER}',
        arguments: medicao);
  }
}
