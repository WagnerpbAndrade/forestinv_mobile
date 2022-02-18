import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/save_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/update_parcela_usecase.dart';
import 'package:intl/intl.dart';

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

  Future<ApiResponse> createParcela(
      final String projectId, DateTime dataPlantio) {
    final usecase = Modular.get<SaveParcelaUsecase>();
    final numero = txtNumeroParcelaController.text;
    final area = txtAreaParcelaController.text;
    final largura = txtLarguraParcelaController.text;
    final numTalhao = txtNumTalhaoParcelaController.text;
    final latitude = txtLatitudeParcelaController.text;
    final longitude = txtLongitudeParcelaController.text;
    //final dataPlantio = txtDataPlantioParcelaController.text;
    print('Data de plantio: $dataPlantio');
    final espacamento = txtEspacamentoParcelaController.text;
    const tipoParcelaEnum = 'PERMANENTE';

    final DateTime tempDate = DateFormat("yyyy-MM-dd").parse('2022-02-27');

    final parcela = Parcela(
      projetoId: projectId,
      numero: int.parse(numero),
      area: double.parse(area),
      largura: double.parse(largura),
      numTalhao: int.parse(numTalhao),
      latitude: 'latitude',
      longitude: 'longitude',
      dataPlantio: dataPlantio,
      espacamento: espacamento,
      tipoParcelaEnum: tipoParcelaEnum,
    );

    //final mock = getMockParcela();

    return usecase.call(parcela);
  }

  Future<ApiResponse> updateParcela(
      final String parcelaId, final String projectId) {
    final usecase = Modular.get<UpdateParcelaUsecaseImpl>();
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

    final DateTime tempDate =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse(dataPlantio);

    final parcela = Parcela(
      projetoId: projectId,
      numero: int.parse(numero),
      area: double.parse(area),
      largura: double.parse(largura),
      numTalhao: int.parse(numTalhao),
      latitude: 'latitude',
      longitude: 'longitude',
      dataPlantio: tempDate,
      espacamento: espacamento,
      tipoParcelaEnum: tipoParcelaEnum,
    );

    //final mock = getMockParcela();

    return usecase.call(parcela);
  }

  void configPage(final Parcela? parcela) {
    if (parcela != null) {
      final numero = parcela.numero.toString();
      final area = parcela.area.toString();
      final largura = parcela.largura.toString();
      final talhao = parcela.numTalhao.toString();
      final data = parcela.dataPlantio.toString();
      final espacamento = parcela.espacamento.toString();

      txtNumeroParcelaController.text = numero;
      txtAreaParcelaController.text = area;
      txtLarguraParcelaController.text = largura;
      txtNumTalhaoParcelaController.text = talhao;
      txtDataPlantioParcelaController.text = data;
      txtEspacamentoParcelaController.text = espacamento;
    } else {
      txtNumeroParcelaController.text = '';
      txtAreaParcelaController.text = '';
      txtLarguraParcelaController.text = '';
      txtNumTalhaoParcelaController.text = '';
      txtDataPlantioParcelaController.text = '';
      txtEspacamentoParcelaController.text = '';
    }
  }

  Parcela getMockParcela() => Parcela(
        projetoId: 365,
        numero: 25,
        area: 200.0,
        largura: 150.0,
        numTalhao: 1,
        latitude: 'latitude',
        longitude: 'longitude',
        dataPlantio: DateTime.now(),
        espacamento: '5x5',
        tipoParcelaEnum: 'PERMANENTE',
      );

  String getFormattedDate(String date) {
    /// Convert into local date format.
    var localDate = DateTime.parse(date).toLocal();

    /// inputFormat - format getting from api or other func.
    /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
    /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(localDate.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}
