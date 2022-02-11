import 'dart:convert';

Parcela listProjetoResponseFromMap(String str) =>
    Parcela.fromMap(json.decode(str));

String listProjetoResponseToMap(Parcela data) => json.encode(data.toMap());

class Parcela {
  int? id;
  final int? projetoId;
  int numero;
  double area;
  double largura;
  int numTalhao;
  String latitude;
  String longitude;
  String dataPlantio;
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
      required this.latitude,
      required this.longitude,
      required this.dataPlantio,
      required this.espacamento,
      this.idadeParcela,
      required this.tipoParcelaEnum,
      this.dataCriacao,
      this.ultimaAtualizacao});

  factory Parcela.fromMap(Map<String, dynamic> json) => Parcela(
        id: json['id'],
        projetoId: json['projetoId'],
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

  Map<String, dynamic> toMap() => {
        'id': id,
        'projetoId': projetoId,
        'numero': numero,
        'area': area,
        'largura': largura,
        'numTalhao': numTalhao,
        'latitude': latitude,
        'longitude': longitude,
        'dataPlantio': dataPlantio,
        'espacamento': espacamento,
        'tipoParcelaEnum': tipoParcelaEnum,
      };
}
