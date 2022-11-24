import 'package:flutter/material.dart';
import 'package:meditative_coloring/screens/month_date_screen.dart';

import 'signup_screen.dart';

class ReviewSessionScreen extends StatelessWidget {
  const ReviewSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text(
              "REVIEW PAST\nSESSIONS",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: "Calder",
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffAAAAAA),
                  ),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MonthDateScreen(),
                          ),
                        );
                      },
                      child: const ReviewItem(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 24);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: const Color(0xffAAAAAA),
        ),
        color: const Color(0xffF5F5F5),
      ),
      child: Column(
        children: const [
          Text(
            "MM / DD / YYYY",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Rig Sans"),
          ),
          SizedBox(height: 16),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Rig Sans"),
          ),
        ],
      ),
    );
  }
}
