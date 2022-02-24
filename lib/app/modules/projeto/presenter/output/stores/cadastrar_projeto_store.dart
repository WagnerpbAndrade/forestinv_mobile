import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/visibilidade.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/save_project_usecase.dart';
import 'package:mobx/mobx.dart';

part 'cadastrar_projeto_store.g.dart';

class CadastrarProjetoStore = _CadastrarProjetoStoreBase
    with _$CadastrarProjetoStore;

abstract class _CadastrarProjetoStoreBase with Store {
  @observable
  String? nome;

  @action
  void setNome(String value) => nome = value;

  @computed
  bool get nomeIsValid => nome != null && nome!.length >= 6;
  String? get nomeError {
    if (nome == null || nomeIsValid) {
      return null;
    } else if (nome == null || nome!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  @observable
  String? area;

  @action
  void setArea(String value) => area = value;

  @computed
  bool get areaIsValid => area != null && area!.isNotEmpty;
  String? get areaError {
    if (area == null || areaIsValid) {
      return null;
    } else if (area == null || area!.isEmpty) {
      return 'Campo obrigatório';
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
    } else {
      return 'Campo obrigatório';
    }
  }

  @computed
  bool get isFormValid => nomeIsValid && areaIsValid && visibilidadeValid;

  @computed
  Function? get cadastrarOnPressed =>
      (isFormValid && !loading) ? _cadastrar : null;

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  Future<void> _cadastrar() async {
    loading = true;
    final usecase = Modular.get<SaveProjectUsecase>();
    final authStore = Modular.get<AuthStore>();

    final projeto = Project(
      uuid: authStore.getUser().uid,
      nome: nome!,
      area: area,
      visibilidadeProjetoEnum: visibilidade!.description,
    );

    try {
      await usecase.save(projeto);
    } on Exception catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
