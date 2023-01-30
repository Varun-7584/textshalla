 import 'package:flutter/material.dart';
import 'package:textshalla/screens/chat_screen.dart';
import 'package:textshalla/screens/login_screen.dart';
import 'package:textshalla/screens/registration_screen.dart';
import 'package:textshalla/screens/welcome_screen.dart';
import 'package:textshalla/screens/clima/screens/loading_screen.dart';


void main() {
  runApp(TextShalla());
}
class TextShalla extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme:TextTheme(
          bodyText1: TextStyle(color: Colors.black54,
          ),
        ),
      ),
      home : LoadingScreen(),
      /////CREATING ROUTES
      // initialRoute: LoadingScreen(),
      // //initialRoute: WelcomeScreen.id,
      // routes:{
      //   WelcomeScreen.id:(context) => WelcomeScreen(),
      //   LoginScreen.id:(context) =>LoginScreen(),
      //   RegistrationScreen.id:(context) =>RegistrationScreen(),
      //   ChatScreen.id:(context) =>ChatScreen(),

    );
  }
}
