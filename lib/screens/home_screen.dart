import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditative_coloring/screens/drawer_screen.dart';
import 'package:meditative_coloring/models/user.dart';
import 'package:meditative_coloring/screens/notification_screen.dart';
import 'package:meditative_coloring/screens/pickafeeling_screen.dart';
import 'package:meditative_coloring/screens/review_past_screen.dart';
import 'package:meditative_coloring/screens/selectfocus_screen.dart';
import 'package:meditative_coloring/services/local_storage_service.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? selectedIndex;
  List<Map<String, dynamic>> homeScreenData = [
    {
      "title": "Begin Coloring Session",
      "asset": "assets/images/colorsession.png",
    },
    {
      "title": "Review Past Sessions",
      "asset": "assets/images/review.png",
    },
    {
      "title": "Meditative Coloring Ebook",
      "asset": "assets/images/ebook.png",
    },
    {
      "title": "Breathing Exercise",
      "asset": "assets/images/breathing.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isPremium = ref.watch(localStorageProvider).getPaymentOption();
    final user = ref.watch(userProvider);

    return Scaffold(
      key: scaffoldKey,
      endDrawer: const ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
        child: Drawer(
          child: DrawerScreen(),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: SafeArea(
          child: SizedBox.fromSize(
            size: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 0.4,
                      ),
                    ),
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/dumprofile.png"),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "WELCOME",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff979797),
                          fontFamily: "Calder",
                        ),
                      ),
                      Text(
                        user?.firstName ?? "User",
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const NotificationScreen(),
                        ),
                      );
                    },
                    icon: Image.asset(
                      "assets/images/notification.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                    icon: Image.asset(
                      "assets/images/menu.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 44.0),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: homeScreenData.length,
                  itemBuilder: (context, index) {
                    final data = homeScreenData[index];
                    return HomeTile(
                      asset: data["asset"],
                      title: data["title"],
                      isSelected: selectedIndex == index,
                      isAvailable: isPremium ?? false
                          ? true
                          : index <= 1
                              ? true
                              : false,
                      onClick: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        if (selectedIndex == 0) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PickAFeelingScreen(),
                            ),
                          );
                        } else if (selectedIndex == 1) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ReviewPastScreen(),
                            ),
                          );
                        } else if (selectedIndex == 2) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PickAFeelingScreen(),
                          ));
                        } else if (selectedIndex == 3) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SelectFocus(isHome: true,),
                            ),
                          );
                        }
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 24.0,
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

class HomeTile extends StatelessWidget {
  final String asset;
  final String title;
  final bool isSelected;
  final bool isAvailable;
  final VoidCallback onClick;

  const HomeTile({
    Key? key,
    required this.asset,
    required this.title,
    required this.isSelected,
    required this.onClick,
    required this.isAvailable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isAvailable ? onClick : null,
      child: Opacity(
        opacity: isAvailable ? 1.0 : 0.3,
        child: Container(
          constraints: BoxConstraints.tight(
            Size(MediaQuery.of(context).size.width, 110),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: isSelected
                  ? const Color(0xff666666)
                  : const Color(0xffAAAAAA),
            ),
            color:
                isSelected ? const Color(0xffAAAAAA) : const Color(0xffF5F5F5),
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
                    width: 50,
                    height: 50,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
