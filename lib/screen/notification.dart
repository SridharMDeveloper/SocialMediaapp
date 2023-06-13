import 'package:flutter/material.dart';

import 'homepage.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 35, 35),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LandingPage(
                          email: 'sridhar@gmail.com', username: 'sh'),
                    ));
              },
              icon: const Icon(Icons.keyboard_arrow_left)),
          elevation: 0,
          centerTitle: true,
          title: const Text('Notification'),
          backgroundColor: const Color.fromARGB(255, 36, 35, 35),
        ),
        body: Column(
          children: [
            const Center(
              child: Text(
                "No Messages",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("add"))
          ],
        ));
  }
}
