import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/selectfocus_screen.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

class SetYourIntention extends StatefulWidget {
  const SetYourIntention({Key? key}) : super(key: key);

  @override
  State<SetYourIntention> createState() => _SetYourIntentionState();
}

class _SetYourIntentionState extends State<SetYourIntention> {
  final controller = TextEditingController();
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                const Text(
                  "WHAT DO YOU WANT TO COLOR ABOUT?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Calder",
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Be as specific as you would like.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                      fontFamily: "RigSans"),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: TextFormField(
                    maxLines: 40,
                    onChanged: (value) {
                      setState(() {
                        text = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Type here",
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: PrimaryButton(
                    title: "Continue",
                    onClick: text.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectFocus(),
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
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color? primary;
  final VoidCallback? onClick;
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onClick,
    this.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primary ?? const Color(0xff000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onClick,
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
