import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditative_coloring/models/user.dart';
import 'package:meditative_coloring/services/auth_service.dart';

final signupProvider =
    StateNotifierProvider<SignupNotifier, AsyncValue<User?>>((ref) {
  return SignupNotifier(ref.watch(authServiceProvider));
});

class SignupNotifier extends StateNotifier<AsyncValue<User?>> {
  String? _firstname;
  String? _lastname;
  String? _phonenumber;
  String? _email;
  String? _password;
  String? _dateofbirth;
  final AuthService _authService;

  SignupNotifier(this._authService) : super(const AsyncValue.data(null));

  Future<void> signup() async {
    try {
      state = const AsyncValue.loading();
      final user = await _authService.signup(
        email: _email!,
        password: _password!,
        dob: _dateofbirth!,
        firstName: _firstname!,
        lastName: _lastname!,
        phone: _phonenumber!,
      );
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void onSaveFirstname(String? firstname) {
    _firstname = firstname;
  }

  void onSaveLastname(String? lastname) {
    _lastname = lastname;
  }

  void onSavePhonenumber(String? phonenumber) {
    _phonenumber = phonenumber;
  }

  void onSaveEmail(String? email) {
    _email = email;
  }

  void onSavePassword(String? password) {
    _password = password;
  }

  void onSaveDateofbirth(String? dateofbirth) {
    _dateofbirth = dateofbirth;
  }
}
