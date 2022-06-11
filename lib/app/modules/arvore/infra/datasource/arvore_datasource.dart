import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';

abstract class ArvoreDatasource {
  Future<List<Arvore>> getAllByMedicao(dynamic medicaoId);

  Future<List<Arvore>> getAllArvoreByProjeto(dynamic projetoId);

  Future<ApiResponse> save(final Arvore arvore);

  Future<ApiResponse> update(final Arvore arvore);

  Future<ApiResponse> delete(final String arvoreId);
}
