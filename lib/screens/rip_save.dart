import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/final_screen.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

import 'set_your_intension.dart';

class RipSave extends StatelessWidget {
  const RipSave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(isRequired: false),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const TitleWidget(title: "rip or save?"),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                text: "Riping ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                
                children: [
                  TextSpan(
                    text: "permenantly deletes the drawing. ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Saving ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "attaches the drawing to your Session "
                        "Notes to reference later.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: Image.asset(
                "assets/images/ripimg.png",
              ),
            ),
            const SizedBox(height: 24.0),
            PrimaryButton(
              primary: const Color(0xff00CB20),
              title: "RIP IT UP",
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FinalScreen(isFinal: true)
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              title: "SAVE IT",
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FinalScreen(
                      isFinal: true,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      )),
    );
  }
}
