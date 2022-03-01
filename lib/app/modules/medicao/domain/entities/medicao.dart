import 'dart:convert';

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

  factory Medicao.fromMap(Map<String, dynamic> json) => Medicao(
        id: json['id'],
        nomeResponsavel: json['nomeResponsavel'],
        dataMedicao: DateTime.parse(json["dataMedicao"]),
        anoMedicao: json["anoMedicao"],
        ultimaAtualizacao: json["ultimaAtualizacao"] == null
            ? null
            : DateTime.parse(json["ultimaAtualizacao"]),
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
}
