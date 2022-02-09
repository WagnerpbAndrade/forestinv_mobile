import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/save_parcela_usecase.dart';

class CreateParcelaController {
  final TextEditingController txtNumeroParcelaController =
      TextEditingController();
  final TextEditingController txtAreaParcelaController =
      TextEditingController();
  final TextEditingController txtLarguraParcelaController =
      TextEditingController();
  final TextEditingController txtNumTalhaoParcelaController =
      TextEditingController();
  final TextEditingController txtLatitudeParcelaController =
      TextEditingController();
  final TextEditingController txtLongitudeParcelaController =
      TextEditingController();
  final TextEditingController txtDataPlantioParcelaController =
      TextEditingController();
  final TextEditingController txtEspacamentoParcelaController =
      TextEditingController();

  Future<ApiResponse> createParcela(final String projectId) {
    final usecase = Modular.get<SaveParcelaUsecase>();
    final numero = txtNumeroParcelaController.text;
    final area = txtAreaParcelaController.text;
    final largura = txtLarguraParcelaController.text;
    final numTalhao = txtNumTalhaoParcelaController.text;
    final latitude = txtLatitudeParcelaController.text;
    final longitude = txtLongitudeParcelaController.text;
    final dataPlantio = txtDataPlantioParcelaController.text;
    print('Data de plantio: $dataPlantio');
    final espacamento = txtEspacamentoParcelaController.text;
    const tipoParcelaEnum = 'PERMANENTE';

    final parcela = Parcela(
      projetoId: int.parse(projectId),
      numero: int.parse(numero),
      area: double.parse(area),
      largura: double.parse(largura),
      numTalhao: int.parse(numTalhao),
      latitude: '',
      longitude: '',
      dataPlantio: dataPlantio,
      espacamento: espacamento,
      tipoParcelaEnum: tipoParcelaEnum,
    );

    //final mock = getMockParcela();

    return usecase.call(parcela);
  }

  Parcela getMockParcela() => Parcela(
        projetoId: 365,
        numero: 25,
        area: 200.0,
        largura: 150.0,
        numTalhao: 1,
        latitude: 'latitude',
        longitude: 'longitude',
        dataPlantio: '08/02/2022',
        espacamento: '5x5',
        tipoParcelaEnum: 'PERMANENTE',
      );
}
