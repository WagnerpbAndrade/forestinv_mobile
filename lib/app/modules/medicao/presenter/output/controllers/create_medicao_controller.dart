import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/save_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/stores/create_medicao_store.dart';

class CreateMedicaoController {
  final TextEditingController txtNumeroArvoreController =
      TextEditingController();
  final TextEditingController txtNomeResponsavelController =
      TextEditingController();
  final TextEditingController txtDapController = TextEditingController();
  final TextEditingController txtAlturaTotalController =
      TextEditingController();
  final TextEditingController txtLatitudeParcelaController =
      TextEditingController();
  final TextEditingController txtLongitudeParcelaController =
      TextEditingController();
  final TextEditingController txtEstadoArvoreController =
      TextEditingController();
  final TextEditingController txtObservacaoController = TextEditingController();

  Future<ApiResponse> save(final String parcelaId) {
    final usecase = Modular.get<SaveMedicaoUsecase>();
    final store = Modular.get<CreateMedicaoStore>();

    final medicao = Medicao(
      numArvore: int.parse(store.numeroArvore),
      nomeResponsavel: store.responsavel,
      dap: double.parse(store.dap),
      alturaTotal: double.parse(store.altura),
      latitude: 'latitude',
      longitude: 'longitude',
      estadoArvore: 'NORMAL',
      observacao: store.observacao,
      parcelaId: int.parse(parcelaId),
    );

    return usecase.call(medicao);
  }
}
