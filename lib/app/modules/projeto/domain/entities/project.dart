import 'package:equatable/equatable.dart';
import 'package:forestinv_mobile/app/core/interface/base_entity.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/address.dart';

class Project extends Equatable implements BaseEntity {
  final num id;
  final String nome;
  final String area;
  final String visibilidade;
  final Address endereco;
  final DateTime dataCriacao;
  final DateTime ultimaAtualizacao;

  Project({
    required this.id,
    required this.nome,
    required this.area,
    required this.visibilidade,
    required this.endereco,
    required this.dataCriacao,
    required this.ultimaAtualizacao,
  });

  factory Project.fromJson(dynamic json) {
    return Project(
      id: json['id'] as num,
      nome: json['nome'] as String,
      area: json['area'] as String,
      visibilidade: json['visibilidade'] as String,
      endereco: Address.fromJson(json['address']),
      dataCriacao: json['dataCriacao'] as DateTime,
      ultimaAtualizacao: json['ultimaAtualizacao'] as DateTime,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        area,
        visibilidade,
        endereco,
        dataCriacao,
        ultimaAtualizacao,
      ];
}
