import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// Medicao listProjetoResponseFromMap(String str) =>
//     Medicao.fromMap(json.decode(str));

String listProjetoResponseToMap(Medicao data) => json.encode(data.toMap());

class Medicao {
  dynamic id;
  String identificador;
  dynamic parcelaId;
  String nomeResponsavel;
  String descricao;
  int? anoMedicao;
  DateTime? dataMedicao;
  DateTime? ultimaAtualizacao;

  Medicao(
      {this.id,
      required this.identificador,
      this.parcelaId,
      required this.nomeResponsavel,
      required this.descricao,
      this.anoMedicao,
      this.dataMedicao,
      this.ultimaAtualizacao});

  Medicao copyWith({
    dynamic id,
    int? numero,
    dynamic parcelaId,
    String? nomeResponsavel,
    int? anoMedicao,
    DateTime? dataMedicao,
    DateTime? ultimaAtualizacao,
  }) {
    return Medicao(
      id: id ?? this.id,
      identificador: identificador,
      parcelaId: parcelaId ?? this.parcelaId,
      nomeResponsavel: nomeResponsavel ?? this.nomeResponsavel,
      descricao: descricao,
      anoMedicao: anoMedicao ?? this.anoMedicao,
      dataMedicao: dataMedicao ?? this.dataMedicao,
      ultimaAtualizacao: ultimaAtualizacao ?? DateTime.now(),
    );
  }

  factory Medicao.fromMap(Map<String, dynamic> json) => Medicao(
        parcelaId: json['parcelaId'],
        identificador: json['identificador'],
        nomeResponsavel: json['nomeResponsavel'],
        descricao: json['descricao'],
        dataMedicao: getDateTime(json["dataMedicao"]),
        anoMedicao: json["anoMedicao"],
        ultimaAtualizacao: json["ultimaAtualizacao"] == null
            ? null
            : getDateTime(json["ultimaAtualizacao"]),
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parcelaId'] = parcelaId;
    data['identificador'] = identificador;
    data['nomeResponsavel'] = nomeResponsavel;
    data['descricao'] = descricao;
    data['anoMedicao'] = anoMedicao;
    data['dataMedicao'] = dataMedicao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }

  Map<String, dynamic> updateToMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomeResponsavel'] = nomeResponsavel;
    data['descricao'] = descricao;
    data['identificador'] = identificador;
    data['anoMedicao'] = anoMedicao;
    data['dataMedicao'] = dataMedicao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }

  static DateTime getDateTime(Timestamp timestamp) {
    return DateTime.fromMicrosecondsSinceEpoch(
        timestamp.microsecondsSinceEpoch);
  }

  DateTime getProximaMedicao() {
    return DateTime(
        dataMedicao!.year + 1, dataMedicao!.month, dataMedicao!.day);
  }
}
