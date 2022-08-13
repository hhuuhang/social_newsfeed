import 'package:flutter/material.dart';

class UpTabBar extends StatelessWidget {
  const UpTabBar({Key? key}) : super(key: key);

  final upperTab = const TabBar(tabs: <Tab>[
    Tab(icon: Icon(Icons.arrow_forward)),
    Tab(icon: Icon(Icons.arrow_downward)),
    Tab(icon: Icon(Icons.arrow_back)),
  ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: upperTab,
        ),
        body: TabBarView(
          children: [
            Icon(Icons.flight, size: 10),
            Icon(Icons.directions_transit, size: 10),
            Icon(Icons.directions_car, size: 10),
          ],
        ),
      ),
    );
  }
}
