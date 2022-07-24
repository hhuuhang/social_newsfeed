import 'package:flutter/material.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/buttons/primary_button.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/buttons/white_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double maxWidthScreen = size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: maxWidthScreen,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                const Spacer(
                  flex: 8,
                ),
                const Text(
                  'Find new\nfriends nearby',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  'With milions of users all over the world, we gives you the ability to connect with people no matter where you are.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                WhiteButton(
                  content: 'Login',
                  onClick: () {},
                ),
                const Spacer(
                  flex: 1,
                ),
                PrimaryButton(
                  content: 'Login',
                  onClick: () {},
                ),
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  'Or lof in with',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage('assets/icons/facebook.png'),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.amber,
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
      ),
    );
  }
}
