import 'package:flutter/material.dart';
class RegistrationScreen extends StatefulWidget {
  static const String id ='registration_id';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body : Center(child: Text('Registration Screen ')),
      )
    ;
  }
}
