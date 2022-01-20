import 'dart:convert';

import 'package:equatable/equatable.dart';

List<ParcelaEntity> projectFromMap(String str) => List<ParcelaEntity>.from(
    json.decode(str).map((x) => ParcelaEntity.fromMap(x)));

String projectToMap(List<ParcelaEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ParcelaEntity extends Equatable {
  final int id;
  final int numero;
  final int area;
  final int largura;
  final int numTalhao;
  final String latitude;
  final String longitude;
  final String dataPlantio;
  final String espacamento;
  final int idadeParcela;
  final String tipoParcelaEnum;
  final String dataCriacao;
  final String ultimaAtualizacao;

  ParcelaEntity({
    required this.id,
    required this.numero,
    required this.area,
    required this.largura,
    required this.numTalhao,
    required this.latitude,
    required this.longitude,
    required this.dataPlantio,
    required this.espacamento,
    required this.idadeParcela,
    required this.tipoParcelaEnum,
    required this.dataCriacao,
    required this.ultimaAtualizacao,
  });

  factory ParcelaEntity.fromMap(Map<String, dynamic> json) => ParcelaEntity(
        id: json['id'],
        numero: json['numero'],
        area: json['area'],
        largura: json['largura'],
        numTalhao: json['numTalhao'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        dataPlantio: json['dataPlantio'],
        espacamento: json['espacamento'],
        idadeParcela: json['idadeParcela'],
        tipoParcelaEnum: json['tipoParcelaEnum'],
        dataCriacao: json['dataCriacao'],
        ultimaAtualizacao: json['ultimaAtualizacao'],
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['numero'] = numero;
    data['area'] = area;
    data['largura'] = largura;
    data['numTalhao'] = numTalhao;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['dataPlantio'] = dataPlantio;
    data['espacamento'] = espacamento;
    data['idadeParcela'] = idadeParcela;
    data['tipoParcelaEnum'] = tipoParcelaEnum;
    data['dataCriacao'] = dataCriacao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }

  @override
  List<Object?> get props =>
      [id, numero, area, largura, largura, longitude, dataCriacao];
}
