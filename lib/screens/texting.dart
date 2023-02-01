import 'package:flutter/material.dart';
import 'package:textshalla/main.dart';
import 'chat_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';



class Texting extends StatefulWidget {
  static const String id = 'texting';
  @override
  State<Texting> createState() => _TextingState();
}

class _TextingState extends State<Texting> {
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
        title: Text('chats',
          style: TextStyle(
            color: Colors.black54,
          ),),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.green.shade100,
        body: textApli(),
    );

  }
}

class textApli extends StatefulWidget {


  @override
  State<textApli> createState() => _textApliState();
}

class _textApliState extends State<textApli> {
  @override
  Widget build(BuildContext context) {
    return
      // Container(
      //     padding: EdgeInsets.all(16.0),
      //     child: Row(
      //
      //       children: <Widget>[
      //         Expanded(
      //             child: TextField(
      //               textAlign: TextAlign.center,
      //               cursorColor: Colors.black54,
      //               obscureText: true,
      //               onChanged: (value){
      //
      //               },
      //               decoration: const InputDecoration(
      //                 border: OutlineInputBorder(),
      //                 labelText: 'Enter Text',
      //               ),
      //
      //             )
      //         )
      //       ],
      //     )
      Container(
          alignment: Alignment.bottomCenter, // align the row
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
              cursorColor: Colors.black54,
              obscureText: true,
              onChanged: (value){

              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Text',

                  ),
              ),
              ),
            ],
          )
      )


      ;
  }
}



