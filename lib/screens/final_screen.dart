import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/release_screen.dart';
import 'package:meditative_coloring/screens/set_your_intension.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

class FinalScreen extends StatelessWidget {
  final bool isFinal;
  const FinalScreen({Key? key, required this.isFinal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(isRequired: false,),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                "ANYTHING ELSE?".toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: "Calder",
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              const Text(
                "Use the space below for any thoughts you have after completing this coloring session.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "RigSans",
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 35),
              const Expanded(
                child: TextField(
                  maxLines: 30,
                  decoration: InputDecoration(
                    hintText: "Type here",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: PrimaryButton(
                    title: "Continue",
                    onClick: () {
                      if (!isFinal) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReleaseScreen()),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
