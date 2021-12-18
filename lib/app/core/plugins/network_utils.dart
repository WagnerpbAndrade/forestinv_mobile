import 'package:connectivity/connectivity.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class NetworkManager {
  Future<bool> isOffline();

  Future<bool> isOnline();
}

class FlutterNetworkManager extends NetworkManager {
  Connectivity connectivity;

  FlutterNetworkManager(this.connectivity);

  Future<bool> isOffline() async {
    return !await isOnline();
  }

  Future<bool> isOnline() async {
    var connectivityResult = await connectivity.checkConnectivity();

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
