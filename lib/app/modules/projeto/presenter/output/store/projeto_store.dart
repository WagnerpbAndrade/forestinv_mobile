import 'package:mobx/mobx.dart';

part 'projeto_store.g.dart';

class ProjetoStore = _ProjetoStoreBase with _$ProjetoStore;

abstract class _ProjetoStoreBase with Store {
  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;
}
