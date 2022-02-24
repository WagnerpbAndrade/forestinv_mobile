import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/visibilidade.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/datasource/projeto_visibilidade_firebase_datasource.dart';
import 'package:mobx/mobx.dart';

part 'visibilidade_store.g.dart';

class VisibilidadeStore = _VisibilidadeStoreBase with _$VisibilidadeStore;

abstract class _VisibilidadeStoreBase with Store {
  _VisibilidadeStoreBase() {
    _loadVisibilidades();
  }

  ObservableList<Visibilidade> visibilidadesList =
      ObservableList<Visibilidade>();

  @action
  void setVisibilidades(List<Visibilidade> visibilidades) {
    visibilidadesList.clear();
    visibilidadesList.addAll(visibilidades);
  }

  @observable
  String? error;

  @action
  void setError(String value) => error = value;

  Future<void> _loadVisibilidades() async {
    final datasource = Modular.get<ProjetoVisibilidadeFirebaseDatasource>();
    try {
      final result = await datasource.getAll();
      setVisibilidades(result);
    } catch (e) {
      setError(e.toString());
    }
  }
}
