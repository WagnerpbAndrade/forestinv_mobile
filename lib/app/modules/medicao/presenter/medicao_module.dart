import 'package:flutter_modular/flutter_modular.dart';

import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/get_all_medicao_by_parcela.dart';
import 'package:forestinv_mobile/app/modules/medicao/external/datasource/heroku_medicao_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/medicao/infra/repository/medicao_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/controllers/medicao_list_controller.dart';
import 'output/stores/medicao_store.dart';
import 'ui/pages/medicao_list_page.dart';

class MedicaoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MedicaoStore()),
    Bind.lazySingleton((i) => MedicaoListController()),
    Bind((i) => HerokuMedicaoDatasourceImpl(i.get())),
    Bind((i) => MedicaoRepositoryImpl(i.get())),
    Bind((i) => GetAllMedicaoByParcelaImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MedicaoListPage(parcela: args.data)),
  ];
}
