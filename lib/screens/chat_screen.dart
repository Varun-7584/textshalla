import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'registration_screen.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
//////////////////////////for authentication
  //final FirebaseAuth _auth = FirebaseAuth.instance;





  //create a method for getting the authentication

  //back from rebistration screen
  // void getCurrentUser ()async {
  //   try{
  //     final user = await _auth.currentUser;
  //     if (user != null ){
  //       loggedInUser = user ;
  //     }
  //     catch (e){
  //       print(e);
  //     }
  //   }
  //
  // }
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
        title: Text('TextShalla',
        style: TextStyle(
          color: Colors.black54,
        ),),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Center(child: Text("Chat")),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.orange,
      //   unselectedItemColor: Colors.grey.shade600,
      //   selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      //   unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.message),
      //       label: "Chats",
      //
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.group_work),
      //       label: "Channels",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_box),
      //       label: "Profile",
      //     ),
       // ],


      bottomNavigationBar:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.group_work),
            onPressed: () {
              //write your script
            },
          ),
          IconButton(
            icon: Icon(Icons.account_box),
            onPressed: () {
              //write your script
            },
          )
        ], // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
