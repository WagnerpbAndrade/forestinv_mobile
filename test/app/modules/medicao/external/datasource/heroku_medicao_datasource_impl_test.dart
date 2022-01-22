import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/medicao/external/datasource/heroku_medicao_datasource_impl.dart';
import 'package:test/test.dart';

void main() {
  final dio = DioClient();
  final datasource = HerokuMedicaoDatasourceImpl(dio);

  test("Deve retornar uma lista paginada de medicoes", () async {
    final response = await datasource.getMedicaoPagination('15');
    print(response);
  });
}
