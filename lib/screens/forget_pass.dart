import 'package:flutter/material.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({Key? key}) : super(key: key);

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
                      child: const Icon(Icons.chevron_left,
                          color: Color(0xffFFFFFF)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 56),
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
                      height: 40,
                    ),
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Enter your email or phone number\nassociated with your account and we'll send\nan email with instructions to reset your\npassword.",
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xff000000),
                          hintText: "Email address",
                          hintStyle: TextStyle(
                              color: Color(0xffAFAFAF),
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 350),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xff3875FF),
                        fixedSize: Size(MediaQuery.of(context).size.width, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Reset Password",
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
