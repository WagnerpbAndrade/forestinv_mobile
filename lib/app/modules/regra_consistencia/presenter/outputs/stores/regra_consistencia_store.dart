import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/save_all_regras_by_user_usecase.dart';
import 'package:mobx/mobx.dart';

part 'regra_consistencia_store.g.dart';

class RegraConsistenciaStore = _RegraConsistenciaStoreBase
    with _$RegraConsistenciaStore;

abstract class _RegraConsistenciaStoreBase with Store {
  Future<void> salveAllRegrasByUser(final dynamic uuid) async {
    final usecase = Modular.get<SaveAllRegrasByUserUsecase>();

    try {
      await usecase
          .saveAll(RegraConsistencia.createListWithRegrasConsistencia(uuid));
    } catch (e) {
      print('RegraConsistenciaStore - Erro ao salver regras por usuário: $e');
    }
  }
}
