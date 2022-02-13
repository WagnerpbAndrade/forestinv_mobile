import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/get_all_regras_by_user_usecase.dart';

class RegraConsistenciaController {
  Future<ApiResponse> getAllRegrasByUser() async {
    final usecase = Modular.get<GetAllRegrasByUserUsecase>();
    final auth = Modular.get<AuthStore>();
    final uuid = auth.getUser().uid;

    final response = await usecase.getAllByUser(uuid);
    print('Response: $response');
    return response;
  }
}
