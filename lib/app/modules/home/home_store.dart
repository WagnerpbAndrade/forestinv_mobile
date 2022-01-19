import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  Future<List<Project>> getListProject() async {
    final ProjetoStore projetoStore = Modular.get<ProjetoStore>();
    final projetos = await projetoStore.getAllProject();
    return projetos;
  }
}
