import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/session_node.dart';
import 'package:meditative_coloring/screens/set_your_intension.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

class Interpretation extends StatelessWidget {
  const Interpretation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(isRequired: false,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: TitleWidget(title: "Interpertation"),
              ),
              const SizedBox(height: 24.0),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Image.asset(
                      "assets/images/drawing.png",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Expanded(
                child: Text(
                  "Type 3 things that you would like to let go of. "
                  "For example, Worrying about what's next. Be as specific as you'd like.",
                  textAlign: TextAlign.center,
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
                        builder: (context) =>  const SessionNote(isFinal: false),
                      ),
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
