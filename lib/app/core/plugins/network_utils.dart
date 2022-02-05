import 'package:connectivity/connectivity.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class NetworkManager {
  Future<bool> isOffline();

  Future<bool> isOnline();
}

class FlutterNetworkManager extends NetworkManager {
  Connectivity connectivity;

  FlutterNetworkManager(this.connectivity);

  @override
  Future<bool> isOffline() async {
    return !await isOnline();
  }

  @override
  Future<bool> isOnline() async {
    final connectivityResult = await connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    return true;
  }
}

Future<bool> isOffline() {
  final c = Modular.get<FlutterNetworkManager>();
  return c.isOffline();
}
