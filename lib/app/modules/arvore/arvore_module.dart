import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/delete_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/get_all_by_medicao_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/save_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/domain/usecases/update_arvore_usecase.dart';
import 'package:forestinv_mobile/app/modules/arvore/external/datasource/arvore_firestore_datasource.dart';
import 'package:forestinv_mobile/app/modules/arvore/infra/repositories/arvore_repository_impl.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/controllers/arvore_controller.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/controllers/create_arvore_controller.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/arvore_store.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/create_arvore_story.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/pages/arvore_page.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/ui/pages/create_arvore_page.dart';

class ArvoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ArvoreStore()),
    Bind.lazySingleton((i) => CreateArvoreStore()),
    Bind.lazySingleton((i) => ArvoreController()),
    Bind.lazySingleton((i) => CreateArvoreController()),
    Bind((i) => ArvoreFirestoreDatasourceImpl(i())),
    Bind((i) => ArvoreRepositoryImpl(i())),
    Bind((i) => GetAllByMedicaoUsecaseImpl(i())),
    Bind((i) => SaveArvoreUsecaseImpl(i())),
    Bind((i) => UpdateArvoreUsecaseImpl(i())),
    Bind((i) => DeleteArvoreUsecaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ArvorePage(args.data)),
    ChildRoute(RouterConst.CREATE_ARVORE_ROUTER,
        child: (_, args) => CreateArvorePage(args.data)),
  ];
}
