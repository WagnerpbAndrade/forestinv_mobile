import 'package:equatable/equatable.dart';

class Endereco extends Equatable {
  final int? id;
  final String logradouro;
  final String bairro;
  final String numero;
  final String cep;
  final String complemento;
  final String cidade;
  final String estado;

  Endereco({
    this.id,
    required this.logradouro,
    required this.bairro,
    required this.numero,
    required this.cep,
    required this.complemento,
    required this.cidade,
    required this.estado,
  });

  factory Endereco.fromMap(Map<String, dynamic> json) => Endereco(
        id: json["id"],
        logradouro: json["logradouro"],
        bairro: json["bairro"],
        numero: json["numero"],
        cep: json["cep"],
        complemento: json["complemento"],
        cidade: json["cidade"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "logradouro": logradouro,
        "bairro": bairro,
        "numero": numero,
        "cep": cep,
        "complemento": complemento,
        "cidade": cidade,
        "estado": estado,
      };

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
