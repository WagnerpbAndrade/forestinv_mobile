import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/usecases/get_all_regras_by_user_usecase.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/external/data_source/regra_consistencia_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/infra/repository/regra_consistencia_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/controllers/regra_consistencia_controller.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/stores/regra_consistencia_store.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/ui/pages/regra_consistencia_page.dart';

class RegraConsistenciaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegraConsistenciaStore()),
    Bind.lazySingleton((i) => RegraConsistenciaController()),
    Bind((i) => DioClient()),
    Bind((i) => RegraConsistenciaDatasourceImpl(i())),
    Bind((i) => RegraConsistenciaRepositoryImpl(i())),
    Bind((i) => GetAllRegrasByUserUsecaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegraConsistenciaPage()),
  ];
}
