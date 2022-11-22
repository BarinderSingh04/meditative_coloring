import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/release_screen.dart';
import 'package:meditative_coloring/screens/set_your_intension.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

class SessionNote extends StatefulWidget {
  final bool isFinal;

  const SessionNote({Key? key, required this.isFinal}) : super(key: key);

  @override
  State<SessionNote> createState() => _SessionNoteState();
}

class _SessionNoteState extends State<SessionNote> {
  final controller = TextEditingController();

  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(isRequired: false),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "DO YOU AGREE OR DISAGREE WITH THE INTERPRETATION?",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Calder",
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              const Text(
                "Why do you agree or disagree?",
                style: TextStyle(
                    fontFamily: "RigSans",
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 35),
              Expanded(
                child: TextField(
                  maxLines: 30,
                  onChanged: (value) {
                    setState(() {
                      text = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "Type here",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: PrimaryButton(
                  title: "Continue",
                  onClick: text.isEmpty
                      ? null
                      : () {
                          if (!widget.isFinal) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReleaseScreen(),
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
