import 'package:forestinv_mobile/app/modules/projeto/domain/entities/endereco.dart';

abstract class CepApiInterface {
  Future<Endereco> searchInfoByCep(String cep);
}
