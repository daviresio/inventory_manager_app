import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static String keyToken = 'token';

  static Future<T?> getValue<T>(String key) async {
    var prefs = await SharedPreferences.getInstance();
    var value = prefs.get(key);
    return value as T;
  }
}
