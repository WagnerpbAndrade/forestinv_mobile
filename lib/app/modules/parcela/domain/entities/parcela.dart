import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Parcela ParcelaFromMap(String str) => Parcela.fromMap(json.decode(str));

String ParcelaToMap(Parcela data) => json.encode(data.toMap());

class Parcela {
  dynamic id;
  final dynamic projetoId;
  int numero;
  double area;
  double largura;
  int numTalhao;
  String? latitude;
  String? longitude;
  DateTime dataPlantio;
  String espacamento;
  int? idadeParcela;
  String tipoParcelaEnum;
  DateTime? dataCriacao;
  DateTime? ultimaAtualizacao;

  Parcela(
      {this.id,
      this.projetoId,
      required this.numero,
      required this.area,
      required this.largura,
      required this.numTalhao,
      this.latitude,
      this.longitude,
      required this.dataPlantio,
      required this.espacamento,
      this.idadeParcela,
      required this.tipoParcelaEnum,
      this.dataCriacao,
      this.ultimaAtualizacao});

  Parcela copyWith({
    dynamic id,
    dynamic projetoId,
    int? numero,
    double? area,
    double? largura,
    int? numTalhao,
    String? latitude,
    String? longitude,
    DateTime? dataPlantio,
    String? espacamento,
    int? idadeParcela,
    String? tipoParcelaEnum,
    DateTime? dataCriacao,
    DateTime? ultimaAtualizacao,
  }) {
    return Parcela(
      id: id ?? this.id,
      projetoId: projetoId ?? this.projetoId,
      numero: numero ?? this.numero,
      area: area ?? this.area,
      largura: largura ?? this.largura,
      numTalhao: numTalhao ?? this.numTalhao,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dataPlantio: dataPlantio ?? this.dataPlantio,
      espacamento: espacamento ?? this.espacamento,
      idadeParcela: idadeParcela ?? this.idadeParcela,
      tipoParcelaEnum: tipoParcelaEnum ?? this.tipoParcelaEnum,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      ultimaAtualizacao: ultimaAtualizacao ?? this.ultimaAtualizacao,
    );
  }

  factory Parcela.fromMap(Map<String, dynamic> json) => Parcela(
        id: json['id'],
        projetoId: json['projetoId'],
        numero: json['numero'],
        area: json['area'],
        largura: json['largura'],
        numTalhao: json['numTalhao'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        dataPlantio: getDateTime(json['dataPlantio']),
        espacamento: json['espacamento'],
        idadeParcela: json['idadeParcela'],
        tipoParcelaEnum: json['tipoParcelaEnum'],
        dataCriacao: getDateTime(json["dataCriacao"]),
        ultimaAtualizacao: json["ultimaAtualizacao"] == null
            ? null
            : getDateTime(json["ultimaAtualizacao"]),
      );

  Map<String, dynamic> toMap() => {
        'projetoId': projetoId,
        'numero': numero,
        'area': area,
        'largura': largura,
        'numTalhao': numTalhao,
        'latitude': latitude,
        'longitude': longitude,
        'dataPlantio': dataPlantio,
        'idadeParcela': idadeParcela,
        'espacamento': espacamento,
        'tipoParcelaEnum': tipoParcelaEnum,
        'dataCriacao': dataCriacao,
        'ultimaAtualizacao': ultimaAtualizacao,
      };

  Map<String, dynamic> updateToMap() => {
        'numero': numero,
        'area': area,
        'largura': largura,
        'numTalhao': numTalhao,
        'latitude': latitude,
        'longitude': longitude,
        'dataPlantio': dataPlantio,
        'idadeParcela': idadeParcela,
        'espacamento': espacamento,
        'tipoParcelaEnum': tipoParcelaEnum,
        'ultimaAtualizacao': ultimaAtualizacao,
      };

  static DateTime getDateTime(Timestamp timestamp) {
    return DateTime.fromMicrosecondsSinceEpoch(
        timestamp.microsecondsSinceEpoch);
  }
}
