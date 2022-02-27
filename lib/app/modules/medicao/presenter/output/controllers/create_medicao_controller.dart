import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/save_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/update_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/stores/create_medicao_store.dart';

class CreateMedicaoController {
  final TextEditingController txtNomeResponsavelController =
      TextEditingController();

  Future<ApiResponse> save(final String parcelaId) {
    final usecase = Modular.get<SaveMedicaoUsecase>();
    final store = Modular.get<CreateMedicaoStore>();

    final medicao = Medicao(
      nomeResponsavel: store.responsavel,
      parcelaId: parcelaId,
    );

    return usecase.call(medicao);
  }

  Future<ApiResponse> update(final String medicaoId, final String parcelaId) {
    final usecase = Modular.get<UpdateMedicaoUsecase>();
    final store = Modular.get<CreateMedicaoStore>();

    final medicao = Medicao(
      id: medicaoId,
      nomeResponsavel: store.responsavel,
      parcelaId: parcelaId,
    );

    return usecase.call(medicao);
  }

  void configPage(final Medicao? medicao) {
    if (medicao != null) {
      txtNomeResponsavelController.text = medicao.nomeResponsavel;
    } else {
      txtNomeResponsavelController.text = '';
    }
  }
}
