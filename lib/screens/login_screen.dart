import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:just_chat/components/my_button.dart';
import 'package:just_chat/constants.dart';
import 'package:just_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner=false;
  final _auth=FirebaseAuth.instance;
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black54),
                onChanged: (value) {
                  email=value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.black54),
                onChanged: (value) {
                  password=value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              MyButton(
                buttonText: "Log In",
                buttonColor: Colors.lightBlueAccent,
                onPressed: () async{
                  setState(() {
                    showSpinner=true;
                  });
                  try{
                    final newUser= await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(newUser!=null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner=false;
                    });
                  }
                  catch (e){
                    setState(() {
                      showSpinner=false;
                    });
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
