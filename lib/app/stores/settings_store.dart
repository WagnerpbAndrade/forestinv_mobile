import 'package:mobx/mobx.dart';
part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase with Store {
  @observable
  double fontSize = 16;

  @action
  void setFontSize(double value) => fontSize = value;
}
