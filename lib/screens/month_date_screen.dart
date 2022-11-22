import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

class MonthDateScreen extends StatelessWidget {
  const MonthDateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            const Text(
              "MM / DD / YYYY",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Calder"),
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "What do you want to color about?",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Rig Sans",
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  maxLines: 4,
                  decoration: InputDecoration(),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Coloring",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Rig Sans",
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(

                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 26),
                    child: Image.asset(
                      "assets/images/drawing.png",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Interpretation",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Rig Sans",
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  maxLines: 4,
                  decoration: InputDecoration(),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Do you agree or disagree with the interpretation?",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Rig Sans",
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  maxLines: 4,
                  decoration: InputDecoration(),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Anything else?",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Rig Sans",
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  maxLines: 4,
                  decoration: InputDecoration(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
