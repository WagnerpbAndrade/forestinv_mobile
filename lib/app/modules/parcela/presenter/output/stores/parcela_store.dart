import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/delete_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/list_all_parcela_by_projeto.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/ui/pages/cadastrar_parcela_page.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:mobx/mobx.dart';

part 'parcela_store.g.dart';

class ParcelaStore = _ParcelaStoreBase with _$ParcelaStore;

abstract class _ParcelaStoreBase with Store {
  final Project? project;

  _ParcelaStoreBase({this.project}) {
    autorun((_) async {
      setLoading(true);

      try {
        _fetchParcelas();
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<Parcela> parcelaList = ObservableList<Parcela>();

  @action
  void addNewParcelas(List<Parcela> newParcelas) {
    parcelaList.clear();
    parcelaList.addAll(newParcelas);
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
  bool get showProgress => loading && parcelaList.isEmpty;

  Future<void> _fetchParcelas() async {
    final usecase = Modular.get<ListAllParcelaByProjeto>();

    final list = await usecase.call(project?.id);

    addNewParcelas(list);
  }

  void refresh() => _fetchParcelas();

  @action
  Future<void> deleteParcela(final dynamic parcelaId) async {
    final usecase = Modular.get<DeleteParcelaUsecase>();
    loading = true;
    await usecase.call(parcelaId);
    refresh();
  }

  Future<void> goToCadastrarParcelaPage(final BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CadastrarParcelaPage(
          args: [null, project!.id],
        ),
      ),
    );
    if (success != null && success) refresh();
  }

  void goToMedicaoPage(final Parcela parcela) {
    Modular.to.pushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.MEDICAO_ROUTER}',
        arguments: parcela);
  }
}
