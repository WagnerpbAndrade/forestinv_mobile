import 'package:flutter_test/flutter_test.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/repository/project_repository.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockProjectRepository extends Mock implements ProjectRepository {}

main() {
  var repository = MockProjectRepository();
  var usecase = GetAllProjectsUsecaseImpl(repository);

  test('Deve retornar uma lista de projetos', () async {
    when(() => repository.getAll()).thenAnswer((_) async => Right(<Project>[]));

    final result = await usecase.getAll();

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Project>>());
  });
}
