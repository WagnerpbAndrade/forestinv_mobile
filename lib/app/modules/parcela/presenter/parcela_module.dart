import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/delete_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/get_all_parcela_by_project.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/save_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/update_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/external/datasource/heroku_parcela_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/parcela/infra/respository/parcela_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/controllers/create_parcela_controller.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/controllers/parcela_controller.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/stores/create_parcela_store.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/stores/parcela_store.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/ui/pages/create_parcela_page.dart';
import 'ui/pages/parcela_list_page.dart';

class ParcelaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ParcelaStore()),
    Bind.lazySingleton((i) => CreateParcelaStore()),
    Bind((i) => DioClient()),
    Bind((i) => ParcelaController()),
    Bind((i) => CreateParcelaController()),
    Bind((i) => HerokuParcelaDatasourceImpl(i.get())),
    Bind((i) => ParcelaRepositoryImpl(i.get())),
    Bind((i) => GetAllParcelaByProjectImpl(i.get())),
    Bind((i) => SaveParcelaUsecaseImpl(i.get())),
    Bind((i) => UpdateParcelaUsecaseImpl(i.get())),
    Bind((i) => DeleteParcelaUsecaseImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ParcelaListPage(project: args.data)),
    ChildRoute(RouterConst.CREATE_PARCELA_ROUTER,
        child: (_, args) => CreateParcelaPage(args.data)),
  ];
}
