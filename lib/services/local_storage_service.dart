import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

final sharedPrefsProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

final localStorageProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService(
    ref.watch(sharedPrefsProvider),
    const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );
});

class LocalStorageService {
  final SharedPreferences _preferences;
  final FlutterSecureStorage _secureStorage;

  LocalStorageService(this._preferences, this._secureStorage);

  Future<String?> getToken() async {
    return await _secureStorage.read(key: "token");
  }

  Future<void> saveToken(String? token) async {
    return await _secureStorage.write(key: "token", value: token);
  }

  User? getUserDetails() {
    final json = _preferences.getString("user_details");
    return json != null ? User.fromJson(jsonDecode(json)) : null;
  }

  Future<void> saveUserDetails(User user) async {
    await _preferences.setString("user_details", jsonEncode(user.toJson()));
  }

  Future<void> clearSession() async {
    await _preferences.remove("user_details");
    await _secureStorage.delete(key: "token");
    await _preferences.remove("isPremium");
  }

  String? getOnBoarding() {
    return _preferences.getString("onBoarding");
  }

  Future<void> saveOnBoarding() async {
    await _preferences.setString("onBoarding", "1");
  }

  Future<void> savePaymentOption(bool isPremium) async {
    await _preferences.setBool("isPremium", isPremium);
  }

  bool? getPaymentOption(){
    return _preferences.getBool("isPremium");
  }
}
