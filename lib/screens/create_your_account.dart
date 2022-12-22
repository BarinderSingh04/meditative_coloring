import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

import 'login_account.dart';

class CreateYourAccount extends StatelessWidget {
  const CreateYourAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TitleWidget(title: "CREATE YOUR ACCOUNT"),
              const SizedBox(height: 80),
              SecondaryButton(
                title: "Continue with Google",
                iconData: "assets/images/google.png",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInAccount(),
                    ),
                  );
                },
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
              const SizedBox(height: 20),
              SecondaryButton(
                title: "Continue with Email",
                iconData: "assets/images/email.png",
                onClick: () {},
              ),
              const Spacer(),
              const Text(
                "Lorem ipsum dolor sit amet, consetetur sadipscing"
                "elitr, sed diam nonumy eirmod Terms & Conditions"
                "labore et dolore magna aliquyam erat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 32),
              CustomTextWidget(
                leadingText: "Have an account? ",
                trailingText: "Log in",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInAccount(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final String iconData;
  const SecondaryButton({
    Key? key,
    required this.title,
    required this.onClick,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xffAAAAAA),
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconData,
              color: Colors.black,
              width: 26,
              height: 26,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: "RigSans",
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox.square(
              dimension: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  final String leadingText;
  final String trailingText;
  final VoidCallback onClick;
  const CustomTextWidget({
    Key? key,
    required this.leadingText,
    required this.trailingText,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: leadingText,
        style: const TextStyle(
          fontSize: 13.0,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: trailingText,
            recognizer: TapGestureRecognizer()..onTap = onClick,
            style: const TextStyle(
              fontSize: 13.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
