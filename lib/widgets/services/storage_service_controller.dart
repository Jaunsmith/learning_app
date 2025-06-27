import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceController {
  late final SharedPreferences _sharedPreferences;

  Future<StorageServiceController> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }
}
