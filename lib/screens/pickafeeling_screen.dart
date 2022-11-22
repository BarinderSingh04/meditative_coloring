import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/selectfocus_screen.dart';
import 'set_your_intension.dart';
import 'signup_screen.dart';

class PickAFeelingScreen extends StatefulWidget {
  const PickAFeelingScreen({Key? key}) : super(key: key);

  @override
  State<PickAFeelingScreen> createState() => _PickAFeelingScreenState();
}

class _PickAFeelingScreenState extends State<PickAFeelingScreen> {
  int? selectedIndex;
  List<Map<String, dynamic>> selectFocus = [
    {
      "title": " HEAVY ",
      "asset": "assets/images/sad.png",
    },
    {
      "title": " LIGHT ",
      "asset": "assets/images/smile.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(isRequired: false,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                "WHAT TYPE OF FEELINGS DO YOU WANT TO COLOR?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Calder"),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.separated(
                  itemCount: selectFocus.length,
                  itemBuilder: (context, index) {
                    final option = selectFocus[index];
                    return OptionTile(
                      asset: option["asset"],
                      title: option["title"],
                      isSelected: selectedIndex == index,
                      onClick: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetYourIntention(),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 24);
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
