import 'package:flutter/material.dart';
import 'package:social_newsfeed/modules/02_login/page/login_page.dart';
import 'package:social_newsfeed/modules/06_home_page/page/dash_board.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/buttons/primary_button.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/buttons/white_button.dart';
import 'package:social_newsfeed/themes/app_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double maxWidthScreen = size.width;
    return Scaffold(
      body: Container(
        width: maxWidthScreen,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: <Widget>[
              const Spacer(
                flex: 8,
              ),
              SizedBox(
                width: maxWidthScreen - 60,
                child: const Text(
                  'Find new\nfriends nearby',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    fontFamily: AppFonts.avenir,
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                'With milions of users all over the world, we gives you the ability to connect with people no matter where you are.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: AppFonts.avenir,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              WhiteButton(
                content: 'Login',
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              ),
              const SizedBox(
                height: 14,
              ),
              PrimaryButton(
                content: 'Sign Up',
                onClick: () {},
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                'Or log in with',
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                      child: InkWell(
                        child: Image.asset('assets/icons/facebook.png'),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: InkWell(
                        child: Image.asset('assets/icons/twitter.png'),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: InkWell(
                        child: Image.asset('assets/icons/google.png'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashboardPage()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
