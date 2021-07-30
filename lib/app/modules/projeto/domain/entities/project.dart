import 'package:equatable/equatable.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/address.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/enums/visibilidade_projeto_enum.dart';

class Project extends Equatable {
  final num id;
  final String nome;
  final String area;
  final VisibilidadeProjetoEnum visibilidadeProjetoEnum;
  final Address endereco;
  final DateTime dataCriacao;
  final DateTime ultimaAtualizacao;

  Project({
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
