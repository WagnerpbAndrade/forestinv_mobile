import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/client/dio/dio_client.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/controllers/regra_consistencia_controller.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/ui/pages/regra_consistencia_page.dart';

class RegraConsistenciaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegraConsistenciaController()),
    Bind((i) => DioClient()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RegraConsistenciaPage()),
  ];
}
