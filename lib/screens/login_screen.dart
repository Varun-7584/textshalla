import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id ='login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body : Center(child: Text('Login Screen')),
      )
      ;
  }
}