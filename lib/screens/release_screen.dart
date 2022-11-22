import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/guided_meditation.dart';

import 'signup_screen.dart';
import 'set_your_intension.dart';

class ReleaseScreen extends StatefulWidget {
  const ReleaseScreen({Key? key}) : super(key: key);

  @override
  State<ReleaseScreen> createState() => _ReleaseScreenState();
}

class _ReleaseScreenState extends State<ReleaseScreen> {
  final letGoController = TextEditingController();
  final releaseItController = TextEditingController();

  String letGo = "";
  String releaseIt = "";

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const TitleWidget(title: "PREPARE FOR THE GUIDED MEDITATION"),
                  const SizedBox(height: 16),
                  const Text(
                    "During the meditation you'll visualize something heavy that you want to let go of, and something light to replace it.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "RigSans",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: "What do you want to ",
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
                              TextSpan(text: "of?")
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text.rich(
                          TextSpan(
                            text: "For example, ",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "RigSans",
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Worrying about the future. ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: "RigSans"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        FormWidget(
                          textInputAction: TextInputAction.next,
                          controller: letGoController,
                          onChanged: (value) {
                            setState(() {
                              letGo = value;
                            });
                          },
                        ),
                        const SizedBox(height: 40),
                        const Text.rich(
                          TextSpan(
                            text: "What do you want to ",
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
                              TextSpan(text: "with?")
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text.rich(
                          TextSpan(
                            text: "For example, ",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "RigSans",
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Going with the flow. ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: "RigSans"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        FormWidget(
                          textInputAction: TextInputAction.done,
                          controller: releaseItController,
                          onChanged: (value) {
                            setState(() {
                              releaseIt = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: PrimaryButton(
                      title: "Continue",
                      onClick: letGo.isNotEmpty &&
                              releaseIt.isNotEmpty
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GuidedMeditation(
                                    letGo: letGoController.text,
                                    replaceIt: releaseItController.text,
                                  ),
                                ),
                              );
                            }
                          : null
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  const FormWidget({
    Key? key,
    this.controller,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            maxLines: 3,
            onChanged: onChanged,
            keyboardType: TextInputType.text,
            textInputAction: textInputAction,
            decoration: const InputDecoration(
              hintText: "Type here",
            ),
          ),
        ),
      ],
    );
  }
}
