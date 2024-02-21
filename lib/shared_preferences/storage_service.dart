import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _sharedPreferences;

  Future<StorageServices> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }
}
