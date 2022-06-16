import 'package:forestinv_mobile/app/core/interface/api_response.dart';
import 'package:forestinv_mobile/app/modules/account/domain/repository/account_repository.dart';
import 'package:forestinv_mobile/app/modules/account/infra/datasource/account_datasource.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountDatasource datasource;

  AccountRepositoryImpl(this.datasource);

  @override
  Future<ApiResponse> updateProfileName(String profileName) {
    return datasource.updateProfileName(profileName);
  }

  @override
  Future<ApiResponse> updatePassword(String password) {
    return datasource.updatePassword(password);
  }
}
