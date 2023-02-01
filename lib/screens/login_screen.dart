
import 'package:flutter/material.dart';
import 'package:textshalla/screens/chat_screen.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        title: Text('Log In',
          style: TextStyle(
            color: Colors.black54,
          ),),
        backgroundColor: Colors.lightGreen,
      ),
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
  // TextEditingController _passwordTextController = TextEditingController();
  // TextEditingController _emailTextController = TextEditingController();
  get _auth => FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return
      Padding(

        padding: const EdgeInsets.all(2),
        child: Expanded(
          child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 50.0,
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
              child:  TextField(
                // controller: passController,
                textAlign: TextAlign.center,
                cursorColor: Colors.black54,
                onChanged: (value){
                  email = value ;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:
              TextField(
                // controller: passController,
                textAlign: TextAlign.center,
                cursorColor: Colors.black54,
                obscureText: true,
                onChanged: (value){
                  password = value ;
                },
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
                  onPressed: (){
                    try{
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
    email: email,
    password: password)
        .then((value) {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => ChatScreen()));
                      }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
        }

                    catch(e){
                      print(e);
                    }



                    //
                    // FirebaseAuth.instance
                    //     .signInWithEmailAndPassword(
                    //     email: _emailTextController.text,
                    //     password: _passwordTextController.text)
                    //     .then((value) {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => ChatScreen()));
                    // }).onError((error, stackTrace) {
                    //   print("Error ${error.toString()}");
                    // });
                    // print(_emailTextController.text);
                    // print(_passwordTextController.text);

                    // Navigator.pushNamed(context, ChatScreen.id);
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
                    Navigator.pushNamed(context, RegistrationScreen.id);
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
//
// Row signUpOption() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       const Text("Don't have account?",
//           style: TextStyle(color: Colors.white70)),
//       GestureDetector(
//         onTap: () {
//           Navigator.push( context ,
//               MaterialPageRoute(builder: (context) => LoginScreen()));
//         },
//         child: const Text(
//           "Sign Up",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       )
//     ],
//   );
// }
//
// Widget forgetPassword(BuildContext context) {
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     height: 35,
//     alignment: Alignment.bottomRight,
//     child: TextButton(
//       child: const Text(
//         "Forgot Password?",
//         style: TextStyle(color: Colors.white70),
//         textAlign: TextAlign.right,
//       ),
//       onPressed: () => Navigator.push(
//           context, MaterialPageRoute(builder: (context) => ())),
//     ),
//   );
// }


