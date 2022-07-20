import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferences prefs;

  SharedPreferencesHelper(this.prefs) {
    _init();
  }

  void _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setString(final String key, final String value) {
    prefs.setString(key, value);
  }

  void setDouble(final String key, final double value) {
    prefs.setDouble(key, value);
  }

  void getString(final String key) {
    prefs.getString(key);
  }

  void getDouble(final String key) {
    prefs.getDouble(key);
  }

  void removeKey(final String key) async {
    await prefs.remove(key);
  }
}
