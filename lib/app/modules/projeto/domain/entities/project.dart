import 'dart:convert';
import 'package:equatable/equatable.dart';

List<Project> projectFromMap(String str) =>
    List<Project>.from(json.decode(str).map((x) => Project.fromMap(x)));

String projectToMap(List<Project> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Project extends Equatable {
  final int? id;
  final String nome;
  final double area;
  final String? visibilidadeProjetoEnum;
  final DateTime? dataCriacao;
  final DateTime? ultimaAtualizacao;

  const Project({
    this.id,
    required this.nome,
    required this.area,
    this.visibilidadeProjetoEnum,
    this.dataCriacao,
    this.ultimaAtualizacao,
  });

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        id: json["id"],
        nome: json["nome"],
        area: json["area"],
        visibilidadeProjetoEnum: json["visibilidadeProjetoEnum"],
        dataCriacao: DateTime.parse(json["dataCriacao"]),
        ultimaAtualizacao: json["ultimaAtualizacao"] == null
            ? null
            : DateTime.parse(json["ultimaAtualizacao"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "area": area,
        "visibilidadeProjetoEnum": visibilidadeProjetoEnum
      };

  @override
  List<Object?> get props =>
      [id, nome, area, visibilidadeProjetoEnum, dataCriacao];
}
