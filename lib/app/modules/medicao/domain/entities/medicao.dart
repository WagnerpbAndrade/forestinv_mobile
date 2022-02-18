import 'dart:convert';

Medicao listProjetoResponseFromMap(String str) =>
    Medicao.fromMap(json.decode(str));

String listProjetoResponseToMap(Medicao data) => json.encode(data.toMap());

class Medicao {
  dynamic id;
  dynamic parcelaId;
  String nomeResponsavel;
  DateTime? dataMedicao;
  DateTime? ultimaAtualizacao;

  Medicao(
      {this.id,
      this.parcelaId,
      required this.nomeResponsavel,
      this.dataMedicao,
      this.ultimaAtualizacao});

  factory Medicao.fromMap(Map<String, dynamic> json) => Medicao(
        id: json['id'],
        nomeResponsavel: json['nomeResponsavel'],
        dataMedicao: DateTime.parse(json["dataMedicao"]),
        ultimaAtualizacao: json["ultimaAtualizacao"] == null
            ? null
            : DateTime.parse(json["ultimaAtualizacao"]),
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parcelaId'] = parcelaId;
    data['nomeResponsavel'] = nomeResponsavel;
    data['dataMedicao'] = dataMedicao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }
}
