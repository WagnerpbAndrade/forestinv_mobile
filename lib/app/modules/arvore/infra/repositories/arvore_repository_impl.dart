import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/repository/arvore_repository.dart';
import 'package:forestinv_mobile/app/modules/arvore/infra/datasource/arvore_datasource.dart';

class ArvoreRepositoryImpl implements ArvoreRepository {
  final ArvoreDatasource _datasource;

  ArvoreRepositoryImpl(this._datasource);

  @override
  Future<ApiResponse> delete(String arvoreId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Arvore>> getAllByMedicao(dynamic medicaoId) async {
    return _datasource.getAllByMedicao(medicaoId);
  }

  @override
  Future<ApiResponse> save(Arvore arvore) async {
    return _datasource.save(arvore);
  }

  @override
  Future<ApiResponse> update(Arvore arvore) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
