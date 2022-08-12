import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_newsfeed/themes/app_colors.dart';

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
              Stack(children: [
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
              ]),
              Container(
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
