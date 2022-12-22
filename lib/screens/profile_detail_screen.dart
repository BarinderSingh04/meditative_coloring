import 'package:flutter/material.dart';

class Profilesdeatilscreen extends StatelessWidget {
  const Profilesdeatilscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox.fromSize(
            size: const Size.fromHeight(56),
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
                  "Add New Driver",
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      backgroundColor: (Colors.white),
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Text(
            "Full name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
              decoration: const InputDecoration(
            hintText: "Enter name",
          )),
          const SizedBox(height: 15.0),
          const Text(
            "Email address",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter email address",
            ),
          ),
          const SizedBox(height: 15.0),
          const Text("Phone number",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 24.0),
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter phone number"),
          ),
          const SizedBox(height: 15.0),
          const Text(
            "One time password",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24.0),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter otp",
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            "Truck number",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24.0),
          TextFormField(
              decoration: const InputDecoration(
            hintText: "Enter truck number",
          )),
          const SizedBox(height: 15.0),
          const Text(
            "Vehicle Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24.0),
          TextFormField(
            decoration: const InputDecoration(hintText: "Select vehicle type"),
          ),
          const SizedBox(height: 15.0),
          const Text(
            "Dimension of the Truck",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Select vehicle dimension",
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            "Payload",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24.0),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter payloads",
            ),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0, backgroundColor: const Color.fromARGB(255, 33, 103, 243),
              fixedSize: Size(MediaQuery.of(context).size.width, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Add now",
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        ],
      ),
    ));
  }
}

