import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageServices {
  static late SharedPreferences _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setStringList(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }
  static Future<bool> setBool(String key,bool value) {
    return _preferences.setBool(key, value);
  }
  static bool? getBool(String key) {
    return _preferences.getBool(key );
  }
  static List<String>? getStringList(String key) {
    return _preferences.getStringList(key);
  }
}