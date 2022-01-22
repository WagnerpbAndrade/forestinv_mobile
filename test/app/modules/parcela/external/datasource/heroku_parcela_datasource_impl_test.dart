import 'package:flutter_test/flutter_test.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/parcela/external/datasource/heroku_parcela_datasource_impl.dart';

void main() {
  final dio = DioClient();
  final datasource = HerokuParcelaDatasourceImpl(dio);

  test("Deve retornar uma lista paginada de parcelas", () async {
    final response = await datasource.getParcelasPagination('1');
    print(response);
  });
}
