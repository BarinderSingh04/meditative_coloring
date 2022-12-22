import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditative_coloring/screens/login_notifier.dart';
import 'package:meditative_coloring/screens/selectplan_screen.dart';

import 'create_your_account.dart';
import '../configs/extensions.dart';
import '../models/user.dart';

import 'signup_screen.dart';
import 'set_your_intension.dart';

class LogInAccount extends ConsumerStatefulWidget {
  const LogInAccount({Key? key}) : super(key: key);

  @override
  ConsumerState<LogInAccount> createState() => _LogInAccountState();
}

class _LogInAccountState extends ConsumerState<LogInAccount> {
  final fkey = GlobalKey<FormState>();
  bool validEmail = false;
  bool obscuredText = true;
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<User?>>(loginProvider, (previous, state) {
      state.showLoading(context, previous, (data) {
        ref.read(userProvider.notifier).update((state) => data);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const SelectPlanScreen(isSetup: true),
            ),
            (route) => false);
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppbar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: fkey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const TitleWidget(title: "LOG IN TO YOUR ACCOUNT"),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Your Email",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      onSaved: ref.read(loginProvider.notifier).onSaveEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "abc@abc.com",
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: obscuredText,
                      obscuringCharacter: "*",
                      onSaved: ref.read(loginProvider.notifier).onSavePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length < 6) {
                          return "Password can't be less than six characters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "***********",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscuredText = !obscuredText;
                            });
                          },
                          icon: Icon(
                            obscuredText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    PrimaryButton(
                      title: "Continue",
                      onClick: () {
                        if (fkey.currentState!.validate()) {
                          fkey.currentState!.save();
                          ref.read(loginProvider.notifier).login();
                        }
                      },
                    ),
                    const SizedBox(height: 28),
                    const Text("or"),
                    const SizedBox(height: 28),
                    SecondaryButton(
                      title: "Continue with Google",
                      iconData: "assets/images/google.png",
                      onClick: () {},
                    ),
                    const SizedBox(height: 20),
                    SecondaryButton(
                      title: "Continue with Facebook",
                      iconData: "assets/images/facebook.png",
                      onClick: () {},
                    ),
                    const SizedBox(height: 20),
                    SecondaryButton(
                      title: "Continue with Apple",
                      iconData: "assets/images/apple.png",
                      onClick: () {},
                    ),
                    const SizedBox(height: 30),
                    CustomTextWidget(
                      leadingText: "Dont have an account? ",
                      trailingText: "Sign up",
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetUpProfile(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
