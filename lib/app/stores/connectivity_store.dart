import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  _ConnectivityStore() {
    _setupListener();
  }

  void _setupListener() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    setConnected(connectivityResult != ConnectivityResult.none);
  }

  @observable
  bool connected = true;

  @action
  void setConnected(bool value) => connected = value;
}
