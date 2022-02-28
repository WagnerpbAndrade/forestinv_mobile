import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/estado_arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/external/datasource/estado_arvore_firebase_datasource.dart';
import 'package:mobx/mobx.dart';
part 'estado_arvore_store.g.dart';

class EstadoArvoreStore = _EstadoArvoreStoreBase with _$EstadoArvoreStore;

abstract class _EstadoArvoreStoreBase with Store {
  _EstadoArvoreStoreBase() {
    _loadEstados();
  }

  ObservableList<EstadoArvore> estadoArvoreList =
      ObservableList<EstadoArvore>();

  @action
  void setEstadoArvore(List<EstadoArvore> estados) {
    estadoArvoreList.clear();
    estadoArvoreList.addAll(estados);
  }

  @observable
  String? error;

  @action
  void setError(String value) => error = value;

  Future<void> _loadEstados() async {
    final datasource = Modular.get<EstadoArvoreFirebaseDatasource>();
    try {
      final result = await datasource.getAll();
      setEstadoArvore(result);
    } catch (e) {
      setError(e.toString());
    }
  }
}
