import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_newsfeed/modules/10_profile_user/widget/tab_bar.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/avatar/avatar_widgets.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/buttons/primary_button.dart';
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
                    child: FittedBox(
                      child: Image.asset("assets/images/Rectangle.png"),
                      fit: BoxFit.fill,
                    ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jorge Curtis",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              Text(
                                "@jorgecutis",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "128",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "Posts",
                                style: TextStyle(
                                    color: Color(0xff4E586E), fontSize: 15),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "3120",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(
                                    color: Color(0xff4E586E), fontSize: 15),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "5024",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "Follower",
                                style: TextStyle(
                                    color: Color(0xff4E586E), fontSize: 15),
                              ),
                            ],
                          ),
                        ],
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
                        child: PrimaryButton(content: "FOLLOW", onClick: () {}),
                      ),
                    )
                  ],
                ),
              ),
              // UpTabBar(),
              Text(
                "Posts here !!",
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
