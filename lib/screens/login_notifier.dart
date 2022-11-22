import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditative_coloring/services/auth_service.dart';

import '../models/user.dart';

final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<User?>>((ref) {
  return LoginNotifier(ref.watch(authServiceProvider));
});

class LoginNotifier extends StateNotifier<AsyncValue<User?>> {
  String? _email;
  String? _password;
  final AuthService _authService;
  LoginNotifier(this._authService) : super(const AsyncValue.data(null));

  Future<void> login() async {
    try {
      state = const AsyncValue.loading();
      final user = await _authService.login(_email!, _password!);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void onSaveEmail(String? email) {
    _email = email;
  }

  void onSavePassword(String? password) {
    _password = password;
  }
}
