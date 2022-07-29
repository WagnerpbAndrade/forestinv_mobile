import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Parcela ParcelaFromMap(String str) => Parcela.fromMap(json.decode(str));

String ParcelaToMap(Parcela data) => json.encode(data.toMap());

class Parcela {
  dynamic id;
  final dynamic projetoId;
  dynamic identificadorParcela;
  double areaParcela;
  double largura;
  dynamic identificadorTalhao;
  double areaTalhao;
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
      required this.identificadorParcela,
      required this.areaParcela,
      required this.largura,
      required this.identificadorTalhao,
      required this.areaTalhao,
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
    dynamic identificadorParcela,
    double? areaParcela,
    double? largura,
    dynamic identificadorTalhao,
    double? areaTalhao,
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
      identificadorParcela: identificadorParcela ?? this.identificadorParcela,
      areaParcela: areaParcela ?? this.areaParcela,
      largura: largura ?? this.largura,
      identificadorTalhao: identificadorTalhao ?? this.identificadorTalhao,
      areaTalhao: areaTalhao ?? this.areaTalhao,
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
        identificadorParcela: json['identificadorParcela'],
        areaParcela: json['areaParcela'],
        largura: json['largura'],
        identificadorTalhao: json['identificadorTalhao'],
        areaTalhao: json['areaTalhao'],
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
        'identificadorParcela': identificadorParcela,
        'areaParcela': areaParcela,
        'largura': largura,
        'identificadorTalhao': identificadorTalhao,
        'areaTalhao': areaTalhao,
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
        'identificadorParcela': identificadorParcela,
        'areaParcela': areaParcela,
        'largura': largura,
        'identificadorTalhao': identificadorTalhao,
        'areaTalhao': areaTalhao,
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
