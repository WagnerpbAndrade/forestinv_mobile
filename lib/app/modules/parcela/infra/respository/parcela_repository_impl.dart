import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/list_parcela_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/repository/parcela_repository.dart';
import 'package:forestinv_mobile/app/modules/parcela/infra/datasource/parcela_datasource.dart';

class ParcelaRepositoryImpl implements ParcelaRepository {
  final ParcelaDatasource datasource;

  ParcelaRepositoryImpl(this.datasource);

  @override
  Future<ListParcelaResponse> getParcelasPagination(String projectId) async {
    try {
      final result = await datasource.getParcelasPagination(projectId);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> save(Parcela parcela) {
    return datasource.save(parcela);
  }

  @override
  Future<ApiResponse> update(Parcela parcela) {
    return datasource.update(parcela);
  }
}
