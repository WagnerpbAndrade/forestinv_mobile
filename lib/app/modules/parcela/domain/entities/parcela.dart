import 'dart:convert';

Parcela listProjetoResponseFromMap(String str) =>
    Parcela.fromMap(json.decode(str));

String listProjetoResponseToMap(Parcela data) => json.encode(data.toMap());

class Parcela {
  int id;
  int numero;
  double area;
  double largura;
  int numTalhao;
  String latitude;
  String longitude;
  String dataPlantio;
  String espacamento;
  int idadeParcela;
  String tipoParcelaEnum;
  DateTime? dataCriacao;
  DateTime? ultimaAtualizacao;

  Parcela(
      {required this.id,
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
      this.dataCriacao,
      this.ultimaAtualizacao});

  factory Parcela.fromMap(Map<String, dynamic> json) => Parcela(
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
        dataCriacao: DateTime.parse(json["dataCriacao"]),
        ultimaAtualizacao: json["ultimaAtualizacao"] == null
            ? null
            : DateTime.parse(json["ultimaAtualizacao"]),
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
}
