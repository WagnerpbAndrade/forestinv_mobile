import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/account/domain/repository/account_repository.dart';

abstract class UpdateProfileUsecase {
  Future<ApiResponse> updateProfileName(String profileName);
}

class UpdateProfileUsecaseImpl implements UpdateProfileUsecase {
  final AccountRepository repository;

  UpdateProfileUsecaseImpl(this.repository);

  @override
  Future<ApiResponse> updateProfileName(String profileName) {
    return repository.updateProfileName(profileName);
  }
}
