import 'package:flutter/material.dart';
import 'package:social_newsfeed/modules/06_home_page/page/home_page.dart';
import 'package:social_newsfeed/modules/07_streams/pages/streams.dart';
import 'package:social_newsfeed/modules/08_messages/pages/messages.dart';
import 'package:social_newsfeed/modules/09_notifications/pages/notifications.dart';
import 'package:social_newsfeed/modules/10_profile_user/pages/profile_user.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _index = 0;
  final List<Widget> _children = [
    const HomePage(),
    const StreamsPage(),
    const MessagesPage(),
    const NotificationsPage(),
    const ProfileUserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff242A37),
        selectedItemColor: const Color(0xffF54B64),
        unselectedItemColor: const Color(0xff4E586E),
        currentIndex: _index, // this will be set when a new tab is tapped
        iconSize: 30,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/Home.png"),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/Stream.png"),
            ),
            label: 'Streams',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/message.png"),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/Notifications.png"),
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/Profile.png"),
            ),
            label: 'Profiles',
          )
        ],
      ),
      body: _children[_index],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
