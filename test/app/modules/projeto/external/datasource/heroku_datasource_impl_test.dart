import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/datasource/heroku_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/drivers/dio/dio_client.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final dio = DioClient();
  final datasource = HerokuDatasourceImpl(dio);
  test("Deve retornar uma lista de projetos", () async {
    var projetos = await datasource.getAll();
    expect(13, projetos.length);
  });

  test('Deve salvar um projeto', () async {
    final newProjeto = Project(
      nome: "Teste 2",
      area: 120.0,
      visibilidadeProjetoEnum: "PRIVADO",
    );

    final result = await datasource.addProject(newProjeto);
  });

  test('Deve atualizar um projeto', () async {
    final updateProjeto = Project(
      id: 15,
      nome: "Teste Update",
      area: 120.0,
      visibilidadeProjetoEnum: "PRIVADO",
    );

    final result = await datasource.update(updateProjeto);
  });
}
