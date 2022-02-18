import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/save_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/update_medicao_usecase.dart';
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
      nomeResponsavel: store.responsavel,
      // numArvore: int.parse(store.numeroArvore),
      // dap: double.parse(store.dap),
      // alturaTotal: double.parse(store.altura),
      // latitude: 'latitude',
      // longitude: 'longitude',
      // estadoArvore: 'NORMAL',
      // observacao: store.observacao,
      parcelaId: parcelaId,
    );

    return usecase.call(medicao);
  }

  Future<ApiResponse> update(final String medicaoId, final String parcelaId) {
    final usecase = Modular.get<IUpdateMedicaoUsecase>();
    final store = Modular.get<CreateMedicaoStore>();

    final medicao = Medicao(
      id: medicaoId,
      nomeResponsavel: store.responsavel,
      // numArvore: int.parse(store.numeroArvore),
      // dap: double.parse(store.dap),
      // alturaTotal: double.parse(store.altura),
      // latitude: 'latitude',
      // longitude: 'longitude',
      // estadoArvore: 'NORMAL',
      // observacao: txtObservacaoController.text,
      parcelaId: parcelaId,
    );

    return usecase.call(medicao);
  }

  void configPage(final Medicao? medicao) {
    if (medicao != null) {
      txtNomeResponsavelController.text = medicao.nomeResponsavel;
      // txtNumeroArvoreController.text = medicao.numArvore.toString();
      // txtDapController.text = medicao.dap.toString();
      // txtAlturaTotalController.text = medicao.alturaTotal.toString();
      // txtObservacaoController.text = medicao.observacao;
    } else {
      txtNumeroArvoreController.text = '';
      txtNomeResponsavelController.text = '';
      txtDapController.text = '';
      txtAlturaTotalController.text = '';
      txtObservacaoController.text = '';
    }
  }
}
