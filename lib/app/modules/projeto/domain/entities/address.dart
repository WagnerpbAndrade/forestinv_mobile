import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final num id;
  final String logradouro;
  final String bairro;
  final String numero;
  final String cep;
  final String complemento;
  final String cidade;
  final String estado;

  Address({
    required this.id,
    required this.logradouro,
    required this.bairro,
    required this.numero,
    required this.cep,
    required this.complemento,
    required this.cidade,
    required this.estado,
  });

  factory Address.fromJson(dynamic json) {
    return Address(
      id: json['id'] as num,
      logradouro: json['logradouro'] as String,
      bairro: json['bairro'] as String,
      numero: json['numero'] as String,
      cep: json['cep'] as String,
      complemento: json['complemento'] as String,
      cidade: json['cidade'] as String,
      estado: json['estado'] as String,
    );
  }

  @override
  List<Object?> get props => [
        id,
        logradouro,
        bairro,
        numero,
        cep,
        complemento,
        cidade,
        estado,
      ];
}
