import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
        body : register() ,
      )
    ;
  }
}
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return

      Container(
        child: Center(
          // child: Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: TextButton(
          //         onPressed: () {
          //
          //         },
          //         child: Text('Login'),
          //       ),
          //     ),
          //     Expanded(
          //       child: TextButton(
          //         onPressed: () {
          //
          //         },
          //         child: Text('Register'),
          //       ),
          //     )
          //   ],
          // ),
          child: Lottie.asset("Animation/134529-singing-musician.json"),
        ),
      );
  }
}
