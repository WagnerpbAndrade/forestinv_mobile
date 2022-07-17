import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/delete_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/get_all_arvore_by_projeto_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/get_all_by_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/save_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/update_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/external/datasource/arvore_firestore_datasource.dart';
import 'package:forestinv_mobile/app/modules/arvore/external/datasource/estado_arvore_firebase_datasource.dart';
import 'package:forestinv_mobile/app/modules/arvore/infra/repositories/arvore_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/estado_arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/pages/arvore_page.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/pages/cadastrar_arvore_page.dart';
import 'package:forestinv_mobile/app/screens/arvore/estado_arvore_screen.dart';
import 'package:forestinv_mobile/app/screens/arvore/infos_arvore_screen.dart';

class ArvoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ArvoreStore()),
    Bind.lazySingleton((i) => EstadoArvoreStore()),
    Bind((i) => ArvoreFirestoreDatasourceImpl(i())),
    Bind((i) => ArvoreRepositoryImpl(i())),
    Bind((i) => GetAllByMedicaoUsecaseImpl(i())),
    Bind((i) => SaveArvoreUsecaseImpl(i())),
    Bind((i) => UpdateArvoreUsecaseImpl(i())),
    Bind((i) => DeleteArvoreUsecaseImpl(i())),
    Bind((i) => GetAllArvoreByProjetoUsecaseImpl(i())),
    Bind((i) => EstadoArvoreFirebaseDatasource(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ArvorePage(args.data)),
    ChildRoute('/estados', child: (_, args) => const EstadoArvoreScreen()),
    ChildRoute('/arvore_infos', child: (_, args) => const InfosArvoreScreen()),
    ChildRoute(RouterConst.CREATE_ARVORE_ROUTER,
        child: (_, args) => CadastrarArvorePage(args: args.data)),
  ];
}
