import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'login_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
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
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
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
        ));
  }
}
