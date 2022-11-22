import 'package:flutter/material.dart';

class NotificationBlackScreen extends StatelessWidget {
  const NotificationBlackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Column(
        children: [
          SizedBox.fromSize(
            size: const Size.fromHeight(56),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 40,
                  height: 40,
                ),
                const Text(
                  "Notifications",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff303235),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Color(0xffFFFFFF),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                color: Color(0xff303235),
              ),
              child: Column(
                children: const [
                  Notification(
                    pickup: "Pick-up Request Accepted",
                    discription:
                        "Lorem Ipsum is simply dummy text of the printing",
                    time: "3 mins ago",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  Notification(
                    pickup: "Parcel Delivered",
                    discription:
                        "Lorem Ipsum is simply dummy text of the printing",
                    time: "10 mins ago",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Color(0xffFFFFFF)),
                  ),
                  Notification(
                    pickup: "Parcel Dispatched",
                    discription:
                        "Lorem Ipsum is simply dummy text of the printing",
                    time: "3 mins ago",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Color(0xffFFFFFF)),
                  ),
                  Notification(
                    pickup: "Product Picked & Started Journey",
                    discription:
                        "Lorem Ipsum is simply dummy text of the printing",
                    time: "3 mins ago",
                  ),
                  Divider(
                    color: Color(0xffFFFFFF),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Notification extends StatelessWidget {
  final String pickup;
  final String discription;
  final String time;

  const Notification({
    Key? key,
    required this.pickup,
    required this.discription,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              radius: 25,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pickup,
                  style: const TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  discription,
                  style: const TextStyle(
                      color: Color(0xffD7D7D7),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                      color: Color(0xff949494),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
