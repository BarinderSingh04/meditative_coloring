import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/home_screen.dart';
import 'package:meditative_coloring/screens/painter_screen.dart';

import 'signup_screen.dart';
import 'set_your_intension.dart';

Map<int, List<String>> options = {
  0: [
    "beta",
    "mouth",
    "mouth",
  ],
  1: [
    "alpha",
    "mouth",
    "nose",
  ],
  2: [
    "theta",
    "nose",
    "nose",
  ],
  3: [
    "delta",
    "nose",
    "mouth",
  ],
};

class TakeBreathScreen extends StatelessWidget {
  final int index;
  final bool isHome;
  const TakeBreathScreen({Key? key, required this.index, this.isHome = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedList = options[index]!;
    return Scaffold(
      appBar: const MyAppbar(isRequired: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const TitleWidget(title: "TAKE 5 DEEP BREATHS"),
              const SizedBox(height: 32),
              Column(children: [
                const Text(
                  "Breathe IN through your",
                  style: TextStyle(
                      fontFamily: "RigSans",
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xffAAAAAA))),
                  child: Text(
                    selectedList[1],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 36,
                        fontFamily: "RigSans",
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  "Breathe OUT through your",
                  style: TextStyle(
                      fontFamily: "RigSans",
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: const Color(0xffAAAAAA)),
                  ),
                  child: Text(
                    selectedList[2],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 36,
                        fontFamily: "RigSans",
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 48),
                Text.rich(TextSpan(
                  text: "To activate your  ",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "RigSans",
                  ),
                  children: [
                    TextSpan(
                      text: "${selectedList[0]} brainwaves",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "RigSans",
                      ),
                    )
                  ],
                )),
              ]),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: PrimaryButton(
                  title: isHome ? "Home" : "Continue",
                  onClick: () {
                    if (isHome) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DrawItOut(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
