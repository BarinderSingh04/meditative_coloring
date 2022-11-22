import 'package:flutter/material.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox.fromSize(
              size: const Size.fromHeight(56),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 43,
                      height: 43,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff505356),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 96,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                color: Color(0xff303235),
              ),
              width: 414,
              height: 755,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Create new\npassword",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Your new password must be different from previous used passwords.",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xff000000),
                          hintText: "New password",
                          hintStyle: TextStyle(
                              color: Color(0xffAFAFAF), fontSize: 14)),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xff000000),
                          hintText: "Confirm password",
                          hintStyle: TextStyle(
                              color: Color(0xffAFAFAF), fontSize: 14)),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: const Color(0xff3875FF),
                        fixedSize: Size(MediaQuery.of(context).size.width, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Submit now",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
