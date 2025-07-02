import 'dart:convert';

import 'package:learning_app/models/user.dart';
import 'package:learning_app/utility/constant/app_constant.dart';
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

  Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  // this help us to know if we already open the application before or not ...
  bool getDevice() {
    return _sharedPreferences.getBool(AppConstant.USER_STORAGE_KEY) ?? false;
  }

  bool isLoggedIn() {
    return _sharedPreferences.getString(AppConstant.USER_PROFILE_KEY) != null
        ? true
        : false;
  }

  // This is to get the data stored in the local memory...

  String getStoredString(String key) {
    return _sharedPreferences.getString(key) ?? '';
  }

  UserProfile getUserProfile() {
    var userData =
        _sharedPreferences.getString(AppConstant.USER_PROFILE_KEY) ?? '';
    var userJsonData = jsonDecode(userData);

    var userProfile = UserProfile.fromJson(userJsonData);

    return userProfile;
  }
}
