import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/delete_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/get_all_parcela_by_project.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/list_all_parcela_by_projeto.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/save_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/update_parcela_usecase.dart';
import 'package:forestinv_mobile/app/modules/parcela/external/datasource/parcela_firestore_datasource.dart';
import 'package:forestinv_mobile/app/modules/parcela/infra/respository/parcela_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/ui/pages/cadastrar_parcela_page.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/ui/pages/parcela_page.dart';

class ParcelaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => DioClient()),
    Bind((i) => ParcelaFirestoreDatasourceImpl(i.get())),
    Bind((i) => ParcelaRepositoryImpl(i.get())),
    Bind((i) => GetAllParcelaByProjectImpl(i.get())),
    Bind((i) => SaveParcelaUsecaseImpl(i.get())),
    Bind((i) => UpdateParcelaUsecaseImpl(i.get())),
    Bind((i) => DeleteParcelaUsecaseImpl(i.get())),
    Bind((i) => ListAllParcelaByProjetoImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ParcelaPage(project: args.data)),
    ChildRoute(RouterConst.CREATE_PARCELA_ROUTER,
        child: (_, args) => CadastrarParcelaPage(args: args.data)),
  ];
}
