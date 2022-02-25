import 'package:flutter_test/flutter_test.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/datasource/project_datasource_impl.dart';

void main() {
  final dio = DioClient();
  final datasource = ProjectDatasourceImpl(dio);
  test("Deve retornar uma lista de projetos", () async {
    final projetos = await datasource.getAll();
    expect(projetos.length, 10);
  });

  // test('Deve salvar um projeto', () async {
  //   final newProjeto = Project(
  //     nome: "Test saving project",
  //     area: 2022.0,
  //     visibilidadeProjetoEnum: "PRIVADO",
  //   );

  //   final result = await datasource.save(newProjeto);
  // });

  // test('Deve atualizar um projeto', () async {
  //   final updateProjeto = Project(
  //     id: 85,
  //     nome: "Teste Update",
  //     area: 120.0,
  //     visibilidadeProjetoEnum: "PRIVADO",
  //   );

  //   final result = await datasource.update(updateProjeto);
  // });

  test("Deve retornar um projeto by id", () async {
    var nameExpected = "Projeto Alegre";
    var projeto = await datasource.getById(1);

    expect(nameExpected, projeto.nome);
  });

  test("Deve deletar um projeto", () async {
    final deletedProject = '205';
    var isResult = await datasource.delete(deletedProject);

    expect(true, isResult);
  });

  test("Deve retornar uma lista de projetos buscados por nome", () async {
    final searchName = 'teste';
    var projetos = await datasource.getByName(searchName);
    print(projetos);
    expect(projetos.length, 1);
  });
}
