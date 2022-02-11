import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/delete_medicao_usecase.dart';

import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/get_all_medicao_by_parcela.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/save_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/update_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/external/datasource/heroku_medicao_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/medicao/infra/repository/medicao_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/controllers/create_medicao_controller.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/controllers/medicao_list_controller.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/output/stores/create_medicao_store.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/ui/pages/create_medicao_page.dart';
import 'output/stores/medicao_store.dart';
import 'ui/pages/medicao_list_page.dart';

class MedicaoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MedicaoStore()),
    Bind.lazySingleton((i) => MedicaoListController()),
    Bind.lazySingleton((i) => CreateMedicaoStore()),
    Bind.lazySingleton((i) => CreateMedicaoController()),
    Bind((i) => HerokuMedicaoDatasourceImpl(i.get())),
    Bind((i) => MedicaoRepositoryImpl(i.get())),
    Bind((i) => GetAllMedicaoByParcelaImpl(i.get())),
    Bind((i) => SaveMedicaoUsecaseImpl(i.get())),
    Bind((i) => UpdateMedicaoUsecaseImpl(i.get())),
    Bind((i) => DeleteMedicaoUsecaseImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MedicaoListPage(parcela: args.data)),
    ChildRoute(RouterConst.CREATE_MEDICAO_ROUTER,
        child: (_, args) => CreateMedicaoPage(args.data)),
  ];
}
