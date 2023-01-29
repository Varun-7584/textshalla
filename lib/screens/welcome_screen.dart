import 'package:flutter/material.dart';
import 'package:textshalla/screens/login_screen.dart';
import 'package:textshalla/screens/registration_screen.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  /////////////
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text('Login'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  child: Text('Register'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
