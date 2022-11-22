import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/set_your_intension.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Notificataions".toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Calder',
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 6,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Image.asset(
                            "assets/images/blackstar.png",
                            width: 16,
                            height: 16,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, conseteturle Lorem ipsum dolor sit amet, conse.",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'RigSans',
                                color: Colors.black,
                                fontSize: 14),
                          ),
                        ),
                        Image.asset(
                          "assets/images/cross.png",
                          width: 14,
                          height: 14,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 30);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: PrimaryButton(
                title: "Clear all",
                onClick: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
