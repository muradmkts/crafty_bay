import 'package:shared_preferences/shared_preferences.dart';
class LocalCache {
  static Future<void> saveToken(String token) async {
    final SharedPreferences localCache = await SharedPreferences.getInstance();
    await localCache.setString("token", token);
  }

  static Future<String?> fetchToken()async{
    final SharedPreferences localCache = await SharedPreferences.getInstance();
    return await localCache.getString("token");

  }

}