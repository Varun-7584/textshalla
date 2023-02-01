import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:textshalla/main.dart';
import 'package:textshalla/screens/login_screen.dart';
import 'package:textshalla/screens/models/UserModel.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/UserModel.dart';

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
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  //Implement logout functionality
                }),
          ],
          title: Text('Registration',
            style: TextStyle(
              color: Colors.black54,
            ),),
          backgroundColor: Colors.lightGreen,
        ),
        backgroundColor: Colors.black38,
        body : register() ,
      )
    ;
  }
}
class register extends StatefulWidget {


  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  get _auth => FirebaseAuth.instance;
  late String email;
  late String password;

  ///firebase
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  ///create two functions :---
//   void checkValues(){
//     //store the value
//     String email =  emailController.text.trim();
//     //trim is used for spacing
//     String pass = passController.text.trim();
//     ///check that the email is not null
//     if (email == ""|| pass == ""){
// print("please fill all the fields ");
//     }
//     else
//       {
//        signUp( email , password);
//       }
//
//   }
  //
  // void signUp(String email, String password) async {
  //   UserCredential? credential;
  //   try {
  //     credential = await FirebaseAuth.instance.createUserWithEmailAndPassword
  //       (email: email, password: password);
  //   } on FirebaseAuthException catch (e){
  //
  //     print(e.code.toString());
  //   }
  //   if (credential != null ){
  //     String uid = credential.user!.uid;
  //     //usermodel
  //     UserModel newUser = UserModel(
  //       uid: uid,
  //       email: email,
  //       fullname:"",
  //       profilepic: ""
  //     );
  //
  //    // set funtion takes a map
  //     await FirebaseFirestore.instance.collection("users").doc(uid).set
  //       (newUser.toMap()).then((value) {
  //         print("New USer Created");
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return

      // Container(
      //   child: Center(
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
      //     // ),
      //     child: Lottie.asset("Animation/134529-singing-musician.json"),
      //   ),
      //
      Scaffold(

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Container(
                height: 200.0,
                child:  Lottie.asset('Animation/131930-progerss.json'),
              ),
              SizedBox(
                height: 48.0,
              ),

                Container(
                  child: Expanded(
                    child: Column(
                      children: <Widget>[

                        SizedBox(
                          height: 10.0,
                        ),
                        ////////////
                        TextField(
                          // controller: emailController,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.black54,
                          keyboardType: TextInputType.emailAddress,

                          onChanged: (value){
                            email = value;

                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail ',

                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        //////////////////////
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
                        SizedBox(
                          height: 10.0,
                        ),

                      ],
                    ),
                  ),
                ),

              ////////////////////////text field 1

              ////////////////////////////////text field 2
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async{
                      //
                      // signUp( email, password);
                      // // Navigator.pushNamed(context, ChatScreen.id);
                      //   print(email);
                      //  print(password);
                      // FirebaseAuth.instance
                      //     .createUserWithEmailAndPassword(email: emailController.text, password: passController.text)
                      //     .then((value){
                      //   print("new Account Created");
                      //  Navigator.pushNamed(context, LoginScreen.id);
                      // }).onError((error, stackTrace) {
                      //   print("Error${error.toString()}");
                      // });
                      try{
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      print(newUser);
                      if (newUser!= null ) {
                        Navigator.pushNamed(context, LoginScreen.id);
                      }
                      }
                      catch(e){
                        print(e);
                      }

                // try{
                //   final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                //
                // if(newUser != null){
                //   Navigator.pushNamed(context, ChatScreen.id);
                // }
                // }
                // catch(e){
                //   print(e);
                // }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  }
}
