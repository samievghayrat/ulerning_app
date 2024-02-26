import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulerning_app/constants/constant.dart';

class StorageServices {
  late final SharedPreferences _sharedPreferences;

  Future<StorageServices> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  bool getIsLoggedIn() {
    return _sharedPreferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ==
            null
        ? true
        : false;
  }

  bool getDeviceFirstOpen() {
    return _sharedPreferences
            .getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ??
        false;
  }
}
