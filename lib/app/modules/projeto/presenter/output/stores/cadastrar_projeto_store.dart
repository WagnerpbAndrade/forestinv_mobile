import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/visibilidade.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/save_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/update_project_usecase.dart';
import 'package:mobx/mobx.dart';

part 'cadastrar_projeto_store.g.dart';

class CadastrarProjetoStore = _CadastrarProjetoStoreBase
    with _$CadastrarProjetoStore;

abstract class _CadastrarProjetoStoreBase with Store {
  _CadastrarProjetoStoreBase(this.projeto) {
    print('Projeto: $projeto');
    nome = projeto?.nome ?? '';
    area = projeto?.area.toString() ?? '';
  }

  final Project? projeto;

  @observable
  String? nome = '';

  @action
  void setNome(String value) => nome = value;

  @computed
  bool get nomeIsValid => nome != null && nome!.length >= 6;
  String? get nomeError {
    if (nome != null && nomeIsValid) {
      return null;
    } else if (nome!.isEmpty) {
      return null;
    } else {
      return 'Nome muito curto';
    }
  }

  @observable
  String area = '';

  @action
  void setArea(String value) => area = value;

  @computed
  bool get areaIsValid => area.isNotEmpty;
  String? get areaError {
    if (areaIsValid) {
      return null;
    } else if (area.isEmpty) {
      return null;
    } else {
      return 'Área inválida';
    }
  }

  @observable
  Visibilidade? visibilidade;

  @action
  void setVisibilidade(Visibilidade value) => visibilidade = value;

  @computed
  bool get visibilidadeValid => visibilidade != null;
  String? get visibilidadeError {
    if (visibilidadeValid) {
      return null;
    }
  }

  @computed
  bool get isFormValid => nomeIsValid && areaIsValid && visibilidadeValid;

  @computed
  Function? get cadastrarOnPressed =>
      (isFormValid && !loading) ? _cadastrar : null;

  @computed
  Function? get editarOnPressed => (isFormValid && !loading) ? _editar : null;

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  bool updatedProject = false;

  @observable
  bool savedProject = false;

  @action
  Future<void> _cadastrar() async {
    loading = true;
    final usecase = Modular.get<SaveProjectUsecase>();
    final authStore = Modular.get<AuthStore>();

    final projeto = Project(
      uuid: authStore.user!.uid,
      nome: nome!,
      area: area,
      visibilidadeProjetoEnum: visibilidade!.description,
    );

    try {
      await usecase.save(projeto);
      savedProject = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _editar() async {
    loading = true;
    final usecase = Modular.get<UpdateProjectUsecase>();
    final authStore = Modular.get<AuthStore>();

    final projetoUpdate = Project(
      id: projeto!.id,
      uuid: authStore.user!.uid,
      nome: nome!,
      area: area,
      visibilidadeProjetoEnum: visibilidade!.description,
    );

    try {
      await usecase.update(projetoUpdate);
      updatedProject = true;
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
