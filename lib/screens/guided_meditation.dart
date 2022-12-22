
import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/read_meditation.dart';
import 'package:meditative_coloring/screens/rip_save.dart';
import 'package:meditative_coloring/screens/set_your_intension.dart';

import 'signup_screen.dart';

class GuidedMeditation extends StatelessWidget {
  final String? letGo;
  final String? replaceIt;
  const GuidedMeditation({
    Key? key,
    this.letGo,
    this.replaceIt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: const MyAppbar(),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SizedBox(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height - (mediaQuery.viewPadding.top + 56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  const TitleWidget(title: "FOLLOW THE GUIDED MEDITATION"),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              iconSize: 35,
                              onPressed: () {},
                              icon: const Icon(Icons.replay_30),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                iconSize: 40,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.forward_10),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "00:00 / 05:00",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          style: TextButton.styleFrom(foregroundColor: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReadMeditation(
                                  letGo: letGo,
                                  replaceIt: replaceIt,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Read the meditation",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text.rich(
                              TextSpan(
                                text: "I want to ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: "let go ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(text: "of.. ")
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          initialValue: letGo,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintMaxLines: 10,
                            hintText:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text.rich(
                              TextSpan(
                                text: "I want to ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: "replace it ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(text: "with..  ")
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          initialValue: replaceIt,
                          decoration: const InputDecoration(
                            hintMaxLines: 10,
                            hintText:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: PrimaryButton(
                      title: "Continue",
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RipSave(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
