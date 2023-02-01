import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:textshalla/screens/texting.dart';
import 'login_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'registration_screen.dart';
import 'package:textshalla/screens/clima/screens/loading_screen.dart';
// import 'package:textshalla/screens/clima/city_screen.dart';
import 'package:textshalla/screens/clima/screens/city_screen.dart';
import 'package:lottie/lottie.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
//////////////////////////for authentication
  //final FirebaseAuth _auth = FirebaseAuth.instance;





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
      ///////////////////////////////////////////////////////////////////
      // body: Container(
      //   child: Center(child:
      //   Column(
      //     children: <Widget>[
      //       TextButton(
      //         child: Text('Press',
      //         ),
      //         onPressed: (){
      //           // Navigator.pushNamed(context, LoadingScreen.id);
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => LoadingScreen()),
      //           );
      //         }
      //         ,)
      //     ],
      //   )),
      // ),
      /////////////////////////////////////
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100.0,
              child:  Lottie.asset('Animation/61302-weather-icon.json'),
            ),
            SizedBox(
              height: 4.0,
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
                      textAlign: TextAlign.center,
                      cursorColor: Colors.black54,

                      onChanged: (value){

//here will be the route from text to app
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Location  ',

                      ),
                    ),

                    //////////////////////

                  ],
                ),
              ),
            ),

            ////////////////////////text field 1

            ////////////////////////////////text field 2
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Material(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: TextButton(
                  onPressed: (){
                    // Navigator.pushNamed(context, LoadingScreen.id);
                             Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
                    //  print(email);
                    // print(password);
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
                  // minWidth: 200.0,
                  // height: 42.0,
                  child: Text(
                    'Current Location Weather ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: TextButton(
                  onPressed: (){
                    // Navigator.pushNamed(context, LoadingScreen.id);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
                    //  print(email);
                    // print(password);
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
                  // minWidth: 200.0,
                  // height: 42.0,
                  child: Text(
                    'Get Weather ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            Container(
              height: 150.0,
              child:  Lottie.asset('Animation/77045-good-weather.json'),
            ),
          ],
        ),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Texting()));

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
