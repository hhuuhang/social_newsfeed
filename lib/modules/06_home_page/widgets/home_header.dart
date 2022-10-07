import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_newsfeed/blocs/app_state_bloc.dart';
import 'package:social_newsfeed/modules/01_welcome_page/page/welcome_page.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/avatar/avatar_widgets.dart';
import 'package:social_newsfeed/route/route_name.dart';
import 'package:social_newsfeed/utils/prefs_key.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({Key? key}) : super(key: key);

  final appStateBloc = AppStateBloc();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(31, 142, 142, 147),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Text("Search"),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: logout,
          // onTap: () {
          // appStateBloc.logout;
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const WelcomePageApp()));
          // },
          child: const AvatarCustomSize(
              picture: "https://randomuser.me/api/portraits/men/24.jpg",
              width: 40,
              height: 40),
        ),
      ],
    );
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    await appStateBloc.changeAppState(AppState.unAuthorized);
  }
}
