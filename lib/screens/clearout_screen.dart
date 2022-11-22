import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/release_screen.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

import 'rip_save.dart';
import 'set_your_intension.dart';

class ClearOutScreen extends StatelessWidget {
  const ClearOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(height: 24),
              const TitleWidget(
                title: "clear it out",
              ),
              const SizedBox(height: 6),
              const Text(
                "Read the script below (outloud or in your head).",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const SizedBox(height: 28),
              const Text(
                "I clear the heavy energies of:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const FormWidget(),
              const SizedBox(height: 24),
              const Text(
                "And cast them to the sun to be repoloarized into light energy. And I replace them with:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const FormWidget(),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: PrimaryButton(
                  title: "Continue",
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RipSave()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
