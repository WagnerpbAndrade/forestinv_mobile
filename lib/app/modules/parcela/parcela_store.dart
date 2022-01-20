import 'package:mobx/mobx.dart';

part 'parcela_store.g.dart';

class ParcelaStore = _ParcelaStoreBase with _$ParcelaStore;

abstract class _ParcelaStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
