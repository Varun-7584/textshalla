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
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Text('Home',
          style: TextStyle(
            color: Colors.black54,
          ),),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.white,
      body: Container(

        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: Lottie.asset("Animation/72342-welcome.json")),
              Expanded(child:
                Column(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Text('Login',
                      style: TextStyle(
                        color: Colors.green
                      ),),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                      child: Text('Register',
                      style: TextStyle(
                        color: Colors.green.shade200
                      ),),
                    ),
                  ],
                ),
              // Expanded(
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, LoginScreen.id);
              //     },
              //     child: Text('Login'),
              //   ),
              // ),
              // Expanded(
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, RegistrationScreen.id);
              //     },
              //     child: Text('Register'),
              //   ),
              // )
              ),],

          ),

        ),
      ),

    );
  }
}
