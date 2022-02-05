import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/controllers/projeto_controller.dart';
import 'package:mobx/mobx.dart';

part 'projeto_store.g.dart';

class ProjetoStore = _ProjetoStoreBase with _$ProjetoStore;

abstract class _ProjetoStoreBase with Store {
  final projetoController = Modular.get<ProjetoController>();
  _ProjetoStoreBase() {
    autorun((_) async {
      try {
        setLoading(true);
        List<Project> projetos;
        if (search.isEmpty) {
          projetos = await projetoController.getAllProject();
        } else {
          projetos = await projetoController.getProjectsByName(search);
        }
        projectsList.clear();
        projectsList.addAll(projetos);
        setError('');
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<Project> projectsList = ObservableList<Project>();

  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @observable
  String error = '';

  @action
  void setError(String value) => error = value;

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;
}
