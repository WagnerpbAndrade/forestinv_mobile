import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/delete_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/list_all_medicao_by_parcela.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/save_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/usecases/update_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/medicao/external/datasource/medicao_firestore_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/medicao/infra/repository/medicao_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/ui/pages/cadastrar_medicao_page.dart';
import 'package:forestinv_mobile/app/modules/medicao/presenter/ui/pages/medicao_page.dart';
import 'output/stores/medicao_store.dart';

class MedicaoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MedicaoStore()),
    Bind((i) => MedicaoRepositoryImpl(i.get())),
    Bind((i) => SaveMedicaoUsecaseImpl(i.get())),
    Bind((i) => UpdateMedicaoUsecaseImpl(i.get())),
    Bind((i) => DeleteMedicaoUsecaseImpl(i.get())),
    Bind((i) => MedicaoFirestoreDatasourceImpl(i.get(), i())),
    Bind((i) => ListAllMedicaoByParcelaImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MedicaoPage(parcela: args.data)),
    ChildRoute(RouterConst.CREATE_MEDICAO_ROUTER,
        child: (_, args) => CadastrarMedicaoPage(args: args.data)),
  ];
}
