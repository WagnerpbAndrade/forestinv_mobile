import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/delete_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/get_all_by_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/pages/cadastrar_arvore_page.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:mobx/mobx.dart';

part 'arvore_store.g.dart';

class ArvoreStore = _ArvoreStoreBase with _$ArvoreStore;

abstract class _ArvoreStoreBase with Store {
  final Medicao? medicao;
  final String? projetoId;

  _ArvoreStoreBase({this.medicao, this.projetoId}) {
    autorun((_) async {
      setLoading(true);
      try {
        _fetchArvores();
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<Arvore> arvoreList = ObservableList<Arvore>();

  @action
  void addNewArvores(List<Arvore> newArvores) {
    arvoreList.clear();
    arvoreList.addAll(newArvores);
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
  bool get showProgress => loading && arvoreList.isEmpty;

  Future<void> _fetchArvores() async {
    final usecase = Modular.get<GetAllByMedicaoUsecase>();

    final list = await usecase.getAllByMedicao(medicao?.id);

    addNewArvores(list);
  }

  void refresh() => _fetchArvores();

  @action
  Future<void> deleteArvore(final dynamic arvoreId) async {
    final usecase = Modular.get<DeleteArvoreUsecase>();
    loading = true;
    await usecase.delete(arvoreId);
    refresh();
  }

  Future<void> goToCadastrarArvorePage(final BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CadastrarArvorePage(
          args: [null, medicao, projetoId],
        ),
      ),
    );
    if (success != null && success) refresh();
  }
}
