import 'dart:convert';
import 'package:ecommerce_app/features/auth/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseServices {
  final String _isFirstTime = "isFirstTime";
  final String _user = "user";
  final String _token = "token";
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

  Future<User?> getUser() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final encodedUser = instance.getString(_user);
      if (encodedUser != null) {
        final mapUser = Map<String, dynamic>.from(json.decode(encodedUser));
        return User.fromMap(mapUser);
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  Future<void> saveUser(User user) async {
    final instance = await SharedPreferences.getInstance();
    final mapUser = user.toMap();
    final encodedUser = jsonEncode(mapUser);
    await instance.setString(_user, encodedUser);
  }

  Future<void> removeUser() async {
    final instance = await SharedPreferences.getInstance();
    instance.remove(_user);
  }

  Future<String> getToken() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString(_token) ?? "";
  }

  Future<void> saveToken(String token) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString(_token, token);
  }

  Future<void> removeToken() async {
    final instance = await SharedPreferences.getInstance();
    instance.remove(_token);
  }
}
