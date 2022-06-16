import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/account/domain/repository/account_repository.dart';

abstract class UpdatePasswordUsecase {
  Future<ApiResponse> updatePassword(String password);
}

class UpdatePasswordUsecaseImpl implements UpdatePasswordUsecase {
  final AccountRepository repository;

  UpdatePasswordUsecaseImpl(this.repository);

  @override
  Future<ApiResponse> updatePassword(String password) {
    return repository.updatePassword(password);
  }
}
