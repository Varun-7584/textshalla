import 'package:flutter/material.dart';
import 'package:textshalla/screens/chat_screen.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: wid(),
    );
  }
}
//
// class bodyy extends StatefulWidget {
//   @override
//   State<bodyy> createState() => _bodyyState();
// }
//
// class _bodyyState extends State<bodyy> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, LoginScreen.id);
//                 },
//                 child: Text('Login'),
//               ),
//             ),
//             Expanded(
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, RegistrationScreen.id);
//                 },
//                 child: Text('Register'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class wid extends StatefulWidget {
  const wid({Key? key}) : super(key: key);

  @override
  State<wid> createState() => _widState();
}
//for the  widget and the login page
class _widState extends State<wid> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(

        padding: const EdgeInsets.all(2),
        child: Expanded(
          child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
               child: Lottie.asset('Animation/93385-login.json'),
                  ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child:  Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.red.shade200,
                )
                ,
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: Text('Login',
                    // style: TextStyle(
                    //     color: Colors.green.shade400),
    ),
                  onPressed: () {
                    // print(nameController.text);
                    // print(passwordController.text);

                    Navigator.pushNamed(context, ChatScreen.id);
                  },
                ),
            ),
            Row(
              children: <Widget>[
                //if the user does not have aa account then -> move to registration screen
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Register ',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {

                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),),);
  }
}
