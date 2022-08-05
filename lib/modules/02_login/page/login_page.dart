import 'package:flutter/material.dart';
import 'package:social_newsfeed/modules/02_login/widgets/text_field_custom.dart';
import 'package:social_newsfeed/modules/common_widget/widgets/buttons/primary_button.dart';
import 'package:social_newsfeed/themes/app_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/loginbackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(72, 36, 42, 55),
                      Color(0xff242A37)
                    ]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome back",
                          style: TextStyle(
                            fontFamily: AppFonts.avenir,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Login to your account",
                          style: TextStyle(
                            fontFamily: AppFonts.avenir,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextField(
                          hint: "Email",
                          inputType: TextInputType.text,
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hint: "Password",
                          inputType: TextInputType.text,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        PrimaryButton(
                          content: "LOGIN",
                          onClick: () {},
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot your password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: AppFonts.avenir,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
