import 'package:equatable/equatable.dart';
import 'package:forestinv_mobile/app/core/interface/base_entity.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/endereco.dart';

import 'dart:convert';

List<Project> projectFromMap(String str) =>
    List<Project>.from(json.decode(str).map((x) => Project.fromMap(x)));

String projectToMap(List<Project> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Project extends Equatable implements BaseEntity {
  final int id;
  final String nome;
  final double area;
  final String visibilidadeProjetoEnum;
  final DateTime dataCriacao;
  final DateTime ultimaAtualizacao;
  final Endereco endereco;

  Project({
    required this.id,
    required this.nome,
    required this.area,
    required this.visibilidadeProjetoEnum,
    required this.dataCriacao,
    required this.ultimaAtualizacao,
    required this.endereco,
  });

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        id: json["id"],
        nome: json["nome"],
        area: json["area"],
        visibilidadeProjetoEnum: json["visibilidadeProjetoEnum"],
        dataCriacao: DateTime.parse(json["dataCriacao"]),
        ultimaAtualizacao: DateTime.parse(json["ultimaAtualizacao"]),
        endereco: Endereco.fromMap(json["endereco"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "area": area,
        "visibilidadeProjetoEnum": visibilidadeProjetoEnum,
        "dataCriacao": dataCriacao,
        "ultimaAtualizacao": ultimaAtualizacao,
        "endereco": endereco.toMap(),
      };

  @override
  List<Object?> get props => [
        id,
        nome,
        area,
        visibilidadeProjetoEnum,
        endereco,
        dataCriacao,
        ultimaAtualizacao,
      ];
}
