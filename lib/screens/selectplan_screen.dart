import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditative_coloring/services/local_storage_service.dart';

import 'home_screen.dart';
import 'signup_screen.dart';
import 'set_your_intension.dart';

class SelectPlanScreen extends ConsumerStatefulWidget {
  final bool isSetup;
  const SelectPlanScreen({required this.isSetup, Key? key}) : super(key: key);

  @override
  ConsumerState<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends ConsumerState<SelectPlanScreen> {
  bool? isPremium;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(
        isClose: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Column(
            children: [
              const TitleWidget(title: "Select your plan"),
              const SizedBox(height: 82),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isPremium = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              elevation: 0,
                              content: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Text("Free plan selected"),
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(),
                            Column(
                              children: const [
                                Text(
                                  "FREE",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "\$0 per year",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  "Monthly Coloring\nSessions:\n1",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "CONTINUE WITH FREE ACCOUNT",
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff888888),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      color: Color(0xffAAAAAA),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isPremium = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              elevation: 0,
                              content: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Text("Premium plan selected"),
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 12.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0xff666666),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Most Helpful",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Colors.white),
                                    ),
                                  )),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "PREMIUM",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "\$40 per year",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 38),
                            const Text(
                              "Monthly Coloring\nSessions:",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                            const Text(
                              "Unlimited",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              " ✔️ Meditative Coloring\neBook",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "✔️ Breathing Exercises",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: PrimaryButton(
          title: isPremium ?? true ? "SET UP PREMIUM PAYMENT" : "CONTINUE",
          onClick: () {
            if (isPremium != null) {
              ref.read(localStorageProvider).savePaymentOption(isPremium!);
              if (widget.isSetup) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              } else {
                Navigator.of(context).pop();
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  elevation: 0,
                  content: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text("Please select a plan to continue!"),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
