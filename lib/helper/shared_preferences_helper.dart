import 'package:forestinv_mobile/app/core/constants/shared_preferences_const.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  late SharedPreferences prefs;

  SharedPreferencesHelper() {
    autorun((_) async {
      prefs = await SharedPreferences.getInstance();
      if (getDouble(SharedPreferencesConst.FONT_SIZE_KEY) == null) {
        setDouble(SharedPreferencesConst.FONT_SIZE_KEY,
            SharedPreferencesConst.FONT_SIZE_VALUE);
      }
    });
  }

  void setString(final String key, final String value) {
    prefs.setString(key, value);
  }

  void setDouble(final String key, final double value) {
    prefs.setDouble(key, value);
  }

  String? getString(final String key) {
    return prefs.getString(key);
  }

  double? getDouble(final String key) {
    return prefs.getDouble(key);
  }

  void removeKey(final String key) async {
    await prefs.remove(key);
  }
}
