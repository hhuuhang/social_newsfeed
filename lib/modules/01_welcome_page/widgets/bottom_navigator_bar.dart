import 'package:flutter/material.dart';

Widget bottomNavigator() => BottomNavigationBar(
      backgroundColor: const Color(0xff242A37),
      unselectedItemColor: const Color(0xFF4E586E),
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
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
            AssetImage("assets/icons/Notification.png"),
          ),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/Profile.png"),
          ),
          label: 'Profiles',
        ),
      ],
      currentIndex: 2,
      selectedItemColor: const Color(0xFFF54B64),
      onTap: null,
    );
