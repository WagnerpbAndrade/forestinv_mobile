import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/bluetooth/presenter/outputs/bluetooth_store.dart';
import 'package:forestinv_mobile/app/modules/bluetooth/presenter/ui/pages/bluetooth_find_page.dart';

class BluetoothModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BluetoothStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BluetoothFindPage()),
  ];
}
