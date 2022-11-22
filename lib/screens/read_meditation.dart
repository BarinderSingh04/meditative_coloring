// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:meditative_coloring/config.dart';
import 'package:meditative_coloring/screens/guided_meditation.dart';
import 'package:meditative_coloring/screens/set_your_intension.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

class ReadMeditation extends StatelessWidget {
  final String? letGo;
  final String? replaceIt;
  const ReadMeditation({Key? key, this.letGo, this.replaceIt})
      : super(key: key);

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
                  const SizedBox(height: 20),
                  const TitleWidget(title: "MEDITATION SCRIPT"),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                            child: const Scrollbar(
                              radius: Radius.circular(8),
                              thickness: 6,
                              child: SingleChildScrollView(
                                child: Text(
                                  loream,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text.rich(
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
                              const SizedBox(height: 8),
                              TextFormField(
                                initialValue: letGo,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text.rich(
                                TextSpan(
                                  text: "I want to ",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "replce it ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(text: "with... ")
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                initialValue: replaceIt,
                                textInputAction: TextInputAction.done,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
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
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GuidedMeditation(),
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
