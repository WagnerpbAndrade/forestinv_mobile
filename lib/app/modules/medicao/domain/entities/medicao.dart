import 'dart:convert';

Medicao listProjetoResponseFromMap(String str) =>
    Medicao.fromMap(json.decode(str));

String listProjetoResponseToMap(Medicao data) => json.encode(data.toMap());

class Medicao {
  int? id;
  int? parcelaId;
  int numArvore;
  String nomeResponsavel;
  double dap;
  double alturaTotal;
  String latitude;
  String longitude;
  String? estadoArvore;
  String observacao;
  DateTime? dataMedicao;
  DateTime? ultimaAtualizacao;

  Medicao(
      {this.id,
      this.parcelaId,
      required this.numArvore,
      required this.nomeResponsavel,
      required this.dap,
      required this.alturaTotal,
      required this.latitude,
      required this.longitude,
      this.estadoArvore,
      required this.observacao,
      this.dataMedicao,
      this.ultimaAtualizacao});

  factory Medicao.fromMap(Map<String, dynamic> json) => Medicao(
        id: json['id'],
        numArvore: json['numArvore'],
        nomeResponsavel: json['nomeResponsavel'],
        dap: json['dap'],
        alturaTotal: json['alturaTotal'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        estadoArvore: json['estadoArvore'],
        observacao: json['observacao'],
        dataMedicao: DateTime.parse(json["dataMedicao"]),
        ultimaAtualizacao: json["ultimaAtualizacao"] == null
            ? null
            : DateTime.parse(json["ultimaAtualizacao"]),
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parcelaId'] = parcelaId;
    data['numArvore'] = numArvore;
    data['nomeResponsavel'] = nomeResponsavel;
    data['dap'] = dap;
    data['alturaTotal'] = alturaTotal;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['estadoArvore'] = estadoArvore;
    data['observacao'] = observacao;
    return data;
  }
}
