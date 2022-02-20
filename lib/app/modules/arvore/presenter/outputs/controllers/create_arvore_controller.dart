import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/entities/arvore.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/save_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/create_arvore_story.dart';

class CreateArvoreController {
  final TextEditingController txtNumeroArvoreController =
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

  void configPage(final Arvore? arvore) {
    if (arvore != null) {
      txtNumeroArvoreController.text = arvore.numArvore.toString();
      txtDapController.text = arvore.dap.toString();
      txtAlturaTotalController.text = arvore.alturaTotal.toString();
      txtObservacaoController.text = arvore.observacao;
    } else {
      txtNumeroArvoreController.text = '';
      txtDapController.text = '';
      txtAlturaTotalController.text = '';
      txtObservacaoController.text = '';
    }
  }

  Future<ApiResponse> save(final String medicaoId) {
    final usecase = Modular.get<SaveArvoreUsecase>();
    final store = Modular.get<CreateArvoreStore>();

    final arvore = Arvore(
      medicaoId: medicaoId,
      numArvore: int.parse(store.numeroArvore),
      dap: double.parse(store.dap),
      alturaTotal: double.parse(store.altura),
      latitude: 'latitude',
      longitude: 'longitude',
      estadoArvore: 'NORMAL',
      observacao: store.observacao,
    );

    return usecase.save(arvore);
  }

  Future<ApiResponse> update(final String medicaoId, final String parcelaId) {
    final usecase = Modular.get<SaveArvoreUsecase>();
    final store = Modular.get<CreateArvoreStore>();

    final arvore = Arvore(
      numArvore: int.parse(store.numeroArvore),
      dap: double.parse(store.dap),
      alturaTotal: double.parse(store.altura),
      latitude: 'latitude',
      longitude: 'longitude',
      estadoArvore: 'NORMAL',
      observacao: txtObservacaoController.text,
    );

    return usecase.save(arvore);
  }
}
