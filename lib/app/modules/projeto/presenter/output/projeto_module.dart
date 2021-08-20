import 'package:forestinv_mobile/app/modules/projeto/domain/usecases/get_all_project_usecase.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/datasource/heroku_datasource_impl.dart';
import 'package:forestinv_mobile/app/modules/projeto/external/drivers/http/http_service.dart';
import 'package:forestinv_mobile/app/modules/projeto/infra/repository/projeto_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/project_controller.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/output/store/projeto_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/projeto/presenter/ui/projeto_page.dart';
import 'package:http/http.dart';

class ProjetoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProjetoStore()),
    Bind.factory((i) => Client()),
    Bind.factory((i) => HttpService(i.get())),
    Bind((i) => HerokuDatasourceImpl()),
    Bind((i) => ProjectRepositoryImpl(i.get())),
    Bind((i) => GetAllProjectsUsecaseImpl(i.get())),
    Bind((i) => ProjectController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProjetoPage()),
  ];
}
