import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Medicao listProjetoResponseFromMap(String str) =>
    Medicao.fromMap(json.decode(str));

String listProjetoResponseToMap(Medicao data) => json.encode(data.toMap());

class Medicao {
  dynamic id;
  dynamic parcelaId;
  String nomeResponsavel;
  int? anoMedicao;
  DateTime? dataMedicao;
  DateTime? ultimaAtualizacao;

  Medicao(
      {this.id,
      this.parcelaId,
      required this.nomeResponsavel,
      this.anoMedicao,
      this.dataMedicao,
      this.ultimaAtualizacao});

  Medicao copyWith({
    dynamic id,
    dynamic parcelaId,
    String? nomeResponsavel,
    int? anoMedicao,
    DateTime? dataMedicao,
    DateTime? ultimaAtualizacao,
  }) {
    return Medicao(
      id: id ?? this.id,
      parcelaId: parcelaId ?? this.parcelaId,
      nomeResponsavel: nomeResponsavel ?? this.nomeResponsavel,
      anoMedicao: anoMedicao ?? this.anoMedicao,
      dataMedicao: dataMedicao ?? this.dataMedicao,
      ultimaAtualizacao: ultimaAtualizacao ?? ultimaAtualizacao,
    );
  }

  factory Medicao.fromMap(Map<String, dynamic> json) => Medicao(
        parcelaId: json['parcelaId'],
        nomeResponsavel: json['nomeResponsavel'],
        dataMedicao: getDateTime(json["dataMedicao"]),
        anoMedicao: json["anoMedicao"],
        ultimaAtualizacao: getDateTime(json["ultimaAtualizacao"]),
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parcelaId'] = parcelaId;
    data['nomeResponsavel'] = nomeResponsavel;
    data['anoMedicao'] = anoMedicao;
    data['dataMedicao'] = dataMedicao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }

  Map<String, dynamic> updateToMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomeResponsavel'] = nomeResponsavel;
    data['anoMedicao'] = anoMedicao;
    data['dataMedicao'] = dataMedicao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }

  static DateTime getDateTime(Timestamp timestamp) {
    return DateTime.fromMicrosecondsSinceEpoch(
        timestamp.microsecondsSinceEpoch);
  }
}
