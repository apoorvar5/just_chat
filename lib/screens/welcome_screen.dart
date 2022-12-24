import 'package:flutter/material.dart';
import 'package:just_chat/screens/login_screen.dart';
import 'package:just_chat/components/my_button.dart';
import 'package:just_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  late AnimationController controller;
  late Animation animation;
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 33),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 60.0,
                      ),
                    ),
                  ),
                  AnimatedTextKit(
                    repeatForever: false,
                    animatedTexts: [
                      TyperAnimatedText(
                        'Just Chat',
                        textStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: Duration(milliseconds: 120),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            MyButton(
              buttonText: "Log In",
              buttonColor: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            MyButton(
              buttonText: "Register",
              buttonColor: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
