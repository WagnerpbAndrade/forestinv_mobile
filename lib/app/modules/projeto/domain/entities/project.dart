import 'dart:convert';
import 'package:equatable/equatable.dart';

List<Project> projectFromMap(String str) =>
    List<Project>.from(json.decode(str).map((x) => Project.fromMap(x)));

String projectToMap(List<Project> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Project extends Equatable {
  final dynamic id;
  final String? uuid;
  final String nome;
  final dynamic area;
  final String? visibilidadeProjetoEnum;
  DateTime? dataCriacao;
  DateTime? ultimaAtualizacao;

  Project({
    this.id,
    this.uuid,
    required this.nome,
    required this.area,
    this.visibilidadeProjetoEnum,
    this.dataCriacao,
    this.ultimaAtualizacao,
  });

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        id: json["id"],
        uuid: json["uuid"],
        nome: json["nome"],
        area: json["area"],
        visibilidadeProjetoEnum: json["visibilidadeProjetoEnum"],
        dataCriacao: DateTime.parse(json["dataCriacao"]),
        ultimaAtualizacao: json["ultimaAtualizacao"] == null
            ? null
            : DateTime.parse(json["ultimaAtualizacao"]),
      );

  Map<String, dynamic> toMap() => {
        "uuid": uuid,
        "nome": nome,
        "area": area,
        "visibilidadeProjetoEnum": visibilidadeProjetoEnum,
        "dataCriacao": dataCriacao,
        "ultimaAtualizacao": ultimaAtualizacao,
      };

  @override
  List<Object?> get props =>
      [id, nome, area, visibilidadeProjetoEnum, dataCriacao];
}
