import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/get_all_parcela_by_project.dart';
import 'package:mobx/mobx.dart';

part 'parcela_store.g.dart';

class ParcelaStore = _ParcelaStoreBase with _$ParcelaStore;

abstract class _ParcelaStoreBase with Store {
  Future<List<Parcela>> getAllParcelaByProject(String projectId) async {
    final usecase = Modular.get<GetAllParcelaByProject>();
    try {
      final response = await usecase.getParcelasPagination(projectId);
      return response.parcelas;
    } catch (e) {
      rethrow;
    }
  }

  void goToMedicaoPage(Parcela parcela) {
    Modular.to.pushNamed('/medicao', arguments: parcela);
  }
}
