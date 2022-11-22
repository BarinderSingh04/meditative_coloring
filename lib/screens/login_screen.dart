import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            CustomBackButton(),
            Text(
              "log in to Your Account",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Calder",
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 24),
          constraints: BoxConstraints.tight(const Size.fromRadius(18)),
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          child: const Center(
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
