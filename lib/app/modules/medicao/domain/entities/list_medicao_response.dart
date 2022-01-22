import 'dart:convert';

import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';

ListMedicaoResponse listProjetoResponseFromMap(String str) =>
    ListMedicaoResponse.fromMap(json.decode(str));

String listProjetoResponseToMap(ListMedicaoResponse data) =>
    json.encode(data.toMap());

class ListMedicaoResponse {
  List<Medicao> medicoes;
  Pageable pageable;
  bool last;
  int totalPages;
  int totalElements;
  Sort? sort;
  bool first;
  int size;
  int number;
  int numberOfElements;
  bool empty;

  ListMedicaoResponse(
      {required this.medicoes,
      required this.pageable,
      required this.last,
      required this.totalPages,
      required this.totalElements,
      this.sort,
      required this.first,
      required this.size,
      required this.number,
      required this.numberOfElements,
      required this.empty});

  factory ListMedicaoResponse.fromMap(Map<dynamic, dynamic> json) =>
      ListMedicaoResponse(
        medicoes:
            List<Medicao>.from(json["content"].map((x) => Medicao.fromMap(x))),
        pageable: Pageable.fromMap(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        first: json["first"],
        sort: Sort.fromMap(json["sort"]),
        number: json["number"],
        numberOfElements: json["numberOfElements"],
        size: json["size"],
        empty: json["empty"],
      );

  Map<String, dynamic> toMap() => {
        "content": List<dynamic>.from(medicoes.map((x) => x.toMap())),
        "pageable": pageable.toMap(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "first": first,
        "sort": sort?.toMap(),
        "number": number,
        "numberOfElements": numberOfElements,
        "size": size,
        "empty": empty,
      };
}

class Content {
  int id;
  int numero;
  int area;
  int largura;
  int numTalhao;
  String latitude;
  String longitude;
  DateTime? dataPlantio;
  String espacamento;
  int idadeParcela;
  String tipoParcelaEnum;
  DateTime? dataCriacao;
  DateTime? ultimaAtualizacao;

  Content(
      {required this.id,
      required this.numero,
      required this.area,
      required this.largura,
      required this.numTalhao,
      required this.latitude,
      required this.longitude,
      this.dataPlantio,
      required this.espacamento,
      required this.idadeParcela,
      required this.tipoParcelaEnum,
      this.dataCriacao,
      this.ultimaAtualizacao});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
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

  Map<String, dynamic> toJson() {
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

class Pageable {
  Sort? sort;
  int offset;
  int pageNumber;
  int pageSize;
  bool paged;
  bool unpaged;

  Pageable(
      {this.sort,
      required this.offset,
      required this.pageNumber,
      required this.pageSize,
      required this.paged,
      required this.unpaged});

  factory Pageable.fromMap(Map<String, dynamic> json) => Pageable(
        sort: json['sort'] != null ? Sort.fromMap(json['sort']) : null,
        offset: json['offset'],
        pageNumber: json['pageNumber'],
        pageSize: json['pageSize'],
        paged: json['paged'],
        unpaged: json['unpaged'],
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sort'] = sort?.toMap();
    data['offset'] = offset;
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

class Sort {
  bool unsorted;
  bool sorted;
  bool empty;

  Sort({required this.unsorted, required this.sorted, required this.empty});

  factory Sort.fromMap(Map<String, dynamic> json) => Sort(
        unsorted: json['unsorted'],
        sorted: json['sorted'],
        empty: json['empty'],
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unsorted'] = unsorted;
    data['sorted'] = sorted;
    data['empty'] = empty;
    return data;
  }
}
