import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_newsfeed/modules/10_profile_user/widget/tab_bar.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/avatar/avatar_widgets.dart';
import 'package:social_newsfeed/themes/app_colors.dart';
import 'package:social_newsfeed/modules/06_home_page/page/dash_board.dart';

class ProfileUserPage extends StatelessWidget {
  const ProfileUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: maxWidth,
                    height: maxWidth * 2 / 3,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onTap: () {},
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: maxWidth / 2.3,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: maxWidth / 6,
                            width: maxWidth / 6,
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://randomuser.me/api/portraits/men/24.jpg"),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "name",
                                style: TextStyle(fontSize: 40),
                              ),
                              Text("@abc"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "1234",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "Posts",
                            style: TextStyle(
                                color: Color(0xff4E586E), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "1234",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                                color: Color(0xff4E586E), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "1234",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "Follower",
                            style: TextStyle(
                                color: Color(0xff4E586E), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Image.asset("assets/icons/add_friends.png"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Color.fromARGB(255, 17, 35, 232),
                    ),
                  )
                ],
              ),
              // UpTabBar(),
              Text(
                "asc",
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
