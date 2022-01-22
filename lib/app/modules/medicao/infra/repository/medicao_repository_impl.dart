import 'package:forestinv_mobile/app/modules/medicao/domain/entities/list_medicao_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/repository/medicao_repository.dart';
import 'package:forestinv_mobile/app/modules/medicao/infra/datasource/medicao_datasource.dart';

class MedicaoRepositoryImpl implements MedicaoRepository {
  final MedicaoDatasource datasource;

  MedicaoRepositoryImpl(this.datasource);
  @override
  Future<ListMedicaoResponse> getMedicaoPagination(String parcelaId) async {
    try {
      return await datasource.getMedicaoPagination(parcelaId);
    } catch (e) {
      throw e;
    }
  }
}
