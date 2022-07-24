import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/core/constants/shared_preferences_const.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'intro_store.g.dart';

class IntroStore = _IntroStoreBase with _$IntroStore;

abstract class _IntroStoreBase with Store {
  Future<bool> isShowHome() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferencesConst.SHOW_HOME_INTRO) ?? false;
  }

  Future<void> savePrefsShowHomeIntro() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPreferencesConst.SHOW_HOME_INTRO, true);
  }

  void goToLogin() {
    Modular.to.popAndPushNamed(RouterConst.LOGIN_ROUTER);
  }
}
