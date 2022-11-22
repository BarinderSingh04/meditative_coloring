import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/review_Session_screen.dart';

import 'home_screen.dart';
import 'signup_screen.dart';

class ReviewPastScreen extends StatelessWidget {
  const ReviewPastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                "REVIEW PAST\n SESSIONS",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Calder"),
              ),
              const SizedBox(
                height: 26,
              ),
              const Text(
                  "You haven’t completed (or saved)\n       a Coloring Session yet."),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: HomeTile(
                  asset: "assets/images/colorsession.png",
                  title: "Begin Coloring \n Session",
                  isSelected: false,
                  isAvailable: true,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ReviewSessionScreen(),
                      ),
                    );
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
