import 'package:flutter/material.dart';
import 'package:just_chat/main.dart';
import 'package:just_chat/screens/registration_screen.dart';

class MyButton extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  VoidCallback onPressed;
  MyButton(
      {required this.buttonText,
      required this.buttonColor,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}
