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
