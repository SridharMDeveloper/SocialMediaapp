import 'package:flutter/material.dart';

class TabBarWeight extends StatefulWidget {
  const TabBarWeight({super.key});

  @override
  State<TabBarWeight> createState() => _TabBarWeightState();
}

class _TabBarWeightState extends State<TabBarWeight> {
  TabController? _controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SizedBox(
            height: 100,
            width: 200,
            child: Column(
              children: [
                const TabBar(tabs: [
                  Text('Post',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Text('Videos',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Text('Saved',
                      style: TextStyle(fontSize: 18, color: Colors.white))
                ]),
                TabBarView(controller: _controller, children: const [
                  Text('HELLO',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Text('Sridhar',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Text('Bro',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ])
              ],
            ),
          ),
        ));
  }
}
