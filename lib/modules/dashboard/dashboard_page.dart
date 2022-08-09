import 'package:flutter/material.dart';
import 'package:social_newsfeed/common/data_type/list_screen.dart';
import 'package:social_newsfeed/modules/01_welcome_page/page/welcome_page.dart';
import 'package:social_newsfeed/modules/02_login/page/login_page.dart';
import 'package:social_newsfeed/modules/08_messages/pages/messages.dart';
import 'package:social_newsfeed/modules/10_profile_user/pages/profile_user.dart';
import 'package:social_newsfeed/modules/common_widget/pages/common_widget_page.dart';
import 'package:social_newsfeed/modules/dashboard/widgets/card_screen.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final paddingSafeAreaSize = MediaQuery.of(context).padding.top +
    MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Screen'),
      ),
      body: Container(
          color: Colors.black,
          // child: ListView.builder(
          //     itemCount: 4,
          //     itemBuilder: (context, index) {
          //       return CardScreen(title: listScreen[index]);
          //     }),
          child: ListView(
            children: [
              CardScreen(
                title: listScreen[0],
                pageWidget: const CommonWidgetPage(),
              ),
              CardScreen(
                title: listScreen[1],
                pageWidget: const WelcomePage(),
              ),
              CardScreen(
                title: listScreen[2],
                pageWidget: const LoginPage(),
              ),
              CardScreen(
                title: listScreen[3],
                pageWidget: const MessagesPage(),
              ),
              CardScreen(
                title: listScreen[4],
                pageWidget: const ProfileUserPage(),
              )
            ],
          )),
    );
  }
}
