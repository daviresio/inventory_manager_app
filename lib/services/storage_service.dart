import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static String keyToken = 'token';

  static Future<T?> getValue<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = await prefs.get(key);
    return value as T;
  }
}
