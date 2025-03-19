import 'package:shared_preferences/shared_preferences.dart';

class DatabaseServices {
  final String _isFirstTime = "isFirstTime";

  Future<bool> get isFirstTime async {
    final instance = await SharedPreferences.getInstance();
    instance.get(_isFirstTime);
    return instance.getBool(_isFirstTime) ?? true;
  }

  Future<bool> setAppOpened() async {
    final instance = await SharedPreferences.getInstance();
    instance.get(_isFirstTime);
    return instance.setBool(_isFirstTime, false);
  }
}
