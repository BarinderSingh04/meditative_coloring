import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditative_coloring/models/user.dart';
import 'package:meditative_coloring/services/api_service.dart';
import 'package:meditative_coloring/services/local_storage_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.watch(apiServiceProvider),
    ref.watch(localStorageProvider),
  );
});

class AuthService {
  final ApiService _apiService;
  final LocalStorageService _localStorageService;

  AuthService(this._apiService, this._localStorageService);

  Future<User> login(String email, String password) async {
    try {
      final jsonResponse = await _apiService.postRequest(
        "/User/Login",
        data: {
          "email": email,
          "password": password,
        },
      );
      final token = jsonResponse["Data"];
      final userJson = jsonResponse["UserData"];
      final user = User.fromJson(userJson);
      _localStorageService.saveToken(token);
      _localStorageService.saveUserDetails(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> signup(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String password,
      required String dob}) async {
    try {
      final jsonResponse = await _apiService.postRequest(
        "/User/SignUp",
        data: {
          "fname": firstName,
          "lname": lastName,
          "email": email,
          "phone": phone,
          "password": password,
          "dob": dob,
        },
      );
      final token = jsonResponse["Data"];
      final userJson = jsonResponse["UserData"];
      final user = User.fromJson(userJson);
      _localStorageService.saveToken(token);
      _localStorageService.saveUserDetails(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
