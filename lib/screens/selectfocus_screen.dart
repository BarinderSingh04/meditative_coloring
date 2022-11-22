import 'package:flutter/material.dart';

import 'signup_screen.dart';
import 'takebreath_screen.dart';

class SelectFocus extends StatefulWidget {
  final bool isHome;
  const SelectFocus({this.isHome = false, Key? key}) : super(key: key);

  @override
  State<SelectFocus> createState() => _SelectFocusState();
}

class _SelectFocusState extends State<SelectFocus> {
  int? selectedIndex;
  List<Map<String, dynamic>> selectFocus = [
    {
      "title": "Feeling more present",
      "asset": "assets/images/sun.png",
    },
    {
      "title": "Quieting my mind",
      "asset": "assets/images/mind.png",
    },
    {
      "title": "Shifting my perspective",
      "asset": "assets/images/Shifting My Perspective_thickest.png",
    },
    {
      "title": "Healing myself",
      "asset": "assets/images/healing.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                "WHAT DO YOU WANT TO FOCUS ON?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Calder"),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.separated(
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
                            builder: ((context) => TakeBreathScreen(
                                  index: index,
                                  isHome: widget.isHome,
                                )),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 24);
                  },
                  itemCount: selectFocus.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String asset;
  final String title;
  final bool isSelected;
  final VoidCallback onClick;

  const OptionTile({
    Key? key,
    required this.asset,
    required this.title,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        constraints: BoxConstraints.tight(
          Size(MediaQuery.of(context).size.width, 55),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: isSelected
                ? const Color(0xff666666)
                : const Color.fromARGB(255, 195, 195, 195),
            width: 0.5,
          ),
          color: isSelected ? const Color(0xffAAAAAA) : const Color(0xffF5F5F5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Image.asset(
                  asset,
                  width: 32,
                  height: 32,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
