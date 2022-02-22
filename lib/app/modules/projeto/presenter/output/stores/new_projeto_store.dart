import 'package:mobx/mobx.dart';

part 'new_projeto_store.g.dart';

class NewProjetoStore = _NewProjetoStoreBase with _$NewProjetoStore;

abstract class _NewProjetoStoreBase with Store {
  @observable
  String? name;
  @observable
  bool errorName = false;
  @observable
  String textErrorName = "";

  @observable
  String? areaProjeto;
  @observable
  bool errorAreaProjeto = false;
  @observable
  String textErrorAreaProjeto = "";
}
