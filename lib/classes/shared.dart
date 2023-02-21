import 'package:shared_preferences/shared_preferences.dart';
import 'package:waelprojects/main.dart';

enum PrefKeys { isLogin, email, password, name }

class sharedPrefController {
  // late SharedPreferences prefs;
  static sharedPrefController? _instance;
  sharedPrefController._();
  factory sharedPrefController() {
    return _instance ??= sharedPrefController._();
  }
  getInit() async {
    prefs = await SharedPreferences.getInstance();
  }

  saveUser({user}) {
    setData(key: PrefKeys.name.name, value: user.name);
    setData(key: PrefKeys.email.name, value: user.email);
    setData(key: PrefKeys.password.name, value: user.password);
  }

  Future<bool> setData({key, value}) async {
    if (value is int) {
      return await prefs!.setInt(key, value);
    } else if (value is double) {
      return await prefs!.setDouble(key, value);
    } else if (value is String) {
      return await prefs!.setString(key, value);
    } else
      return await prefs!.setBool(key, value);
  }

  T? getData<T>({key}) {
    return prefs!.get(key) as T?;
  }

  Future<bool> clear() async {
    return await prefs!.clear();
  }

  Future<bool> remove({Key}) async {
    return await prefs!.remove(Key);
  }
}
