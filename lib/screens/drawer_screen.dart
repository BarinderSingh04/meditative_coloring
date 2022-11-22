import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditative_coloring/screens/login_account.dart';
import 'package:meditative_coloring/models/user.dart';
import 'package:meditative_coloring/screens/selectplan_screen.dart';
import 'package:meditative_coloring/services/local_storage_service.dart';

class DrawerScreen extends ConsumerStatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends ConsumerState<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final isPremium = ref.watch(localStorageProvider).getPaymentOption();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Container(
      color: Colors.black,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/dumprofile.png",
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      user?.firstName ?? "User",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 22.0,
                          fontFamily: 'RigSans'),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      user?.email ?? "User@gmail.com",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RigSans',
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              runSpacing: 34,
              children: [
                if (isPremium != true)
                  DrawerItem(
                      title: "Subscription Plan",
                      asset: "assets/images/subscription.png",
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SelectPlanScreen(
                              isSetup: false,
                            ),
                          ),
                        );
                      }),
                DrawerItem(
                  title: "Invite To App",
                  asset: "assets/images/inviteapp.png",
                  onClick: () {},
                ),
                DrawerItem(
                  title: "Rate App",
                  asset: "assets/images/rateapp.png",
                  onClick: () {},
                ),
                DrawerItem(
                  title: "Help",
                  asset: "assets/images/help.png",
                  onClick: () {},
                ),
                DrawerItem(
                  title: "Terms & Conditions",
                  asset: "assets/images/termscondition.png",
                  onClick: () {},
                ),
                const Divider(
                  color: Colors.white,
                  indent: 24,
                  endIndent: 24,
                  thickness: 1,
                ),
                DrawerItem(
                  title: "Logout",
                  asset: "assets/images/logout.png",
                  onClick: () {
                    ref.read(userProvider.notifier).update((state) => null);
                    ref.read(localStorageProvider).clearSession();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LogInAccount(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String asset;
  final String title;
  final VoidCallback onClick;
  const DrawerItem({
    Key? key,
    required this.asset,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Image.asset(
              asset,
              height: 24,
              width: 24,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                letterSpacing: 1.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'RigSansBold'),
          ),
        ],
      ),
    );
  }
}
