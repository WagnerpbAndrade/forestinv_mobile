import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/usecases/get_all_parcela_by_project.dart';
import 'package:forestinv_mobile/app/modules/parcela/external/datasource/heroku_parcela_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/parcela/infra/respository/parcela_repository_impl.dart';
import '../ui/parcela_page.dart';

import 'parcela_store.dart';

class ParcelaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ParcelaStore()),
    Bind((i) => DioClient()),
    Bind((i) => HerokuParcelaDatasourceImpl(i.get())),
    Bind((i) => ParcelaRepositoryImpl(i.get())),
    Bind((i) => GetAllParcelaByProjectImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ParcelaPage(project: args.data)),
  ];
}
