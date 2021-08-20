import 'package:equatable/equatable.dart';
import 'package:forestinv_mobile/app/core/interface/base_entity.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/endereco.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/enums/visibilidade_projeto_enum.dart';

class ProjetoModel extends Equatable implements BaseEntity {
  final num id;
  final String nome;
  final String area;
  final VisibilidadeProjetoEnum visibilidadeProjetoEnum;
  final Endereco endereco;
  final DateTime dataCriacao;
  final DateTime ultimaAtualizacao;

  ProjetoModel({
    required this.id,
    required this.nome,
    required this.area,
    required this.visibilidadeProjetoEnum,
    required this.endereco,
    required this.dataCriacao,
    required this.ultimaAtualizacao,
  });

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
