import 'package:shared_preferences/shared_preferences.dart';

/// @Description:   sharedprefrences存储工具类，方便后期替换
/// @Author:        ShiShaoPo
/// @CreateData:    2021/05/27  11:54 AM
class SPUtils {
  static late final _prefs = SharedPreferences.getInstance();

  static Future<bool> setString(String key, String value) async {
    final sp = await _prefs;
    return sp.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final sp = await _prefs;
    return sp.getString(key);
  }

  static Future<bool> remove(String key) async {

    final sp = await _prefs;
    return sp.remove(key);
  }
}

class SPConstant {}
