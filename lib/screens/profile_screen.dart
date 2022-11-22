import 'package:flutter/material.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({Key? key}) : super(key: key);

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
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.close),
                    ),
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                const CircleAvatar(
                  radius: 60.0,
                ),
                const SizedBox(height: 12),
                const Text(
                  "John Snow",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
                const Text(
                  "johnsnow@gmail.com",
                ),
                const SizedBox(height: 15.0),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 40, 102, 194),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Icon(Icons.notifications),
                        ),
                        const SizedBox(width: 16.0),
                        const Expanded(
                          child: Text(
                            "Notifications",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Icon(Icons.business_center)),
                        const SizedBox(width: 16.0),
                        const Expanded(
                          child: Text(
                            "Job Management",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Icon(Icons.lock)),
                        const SizedBox(width: 16.0),
                        const Expanded(
                            child: Text(
                          "Change Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                  const Divider(height: 8.0, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Icon(Icons.logout)),
                        const SizedBox(width: 16.0),
                        const Expanded(
                          child: Text(
                            "Log out",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
