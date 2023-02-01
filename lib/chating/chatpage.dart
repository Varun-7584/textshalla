import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textshalla/comps/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../comps/widgets.dart';
// import 'package:textshalla/comps/widgets.dart';

class ChatPage extends StatefulWidget {
  final String id;
  final String name ;
  const ChatPage({Key? key, required this.id, required this.name}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  //create var

  var roomId;
  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.name),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Chats',
                  style: Styles.h1(),
                ),
                const Spacer(),
                StreamBuilder(
        stream: firestore.collection('Users').doc(widget.id).snapshots(),
    builder: (context,AsyncSnapshot<DocumentSnapshot<Map<String , dynamic>>> snapshot) {

                    return !snapshot.hasData?Container(): Text(
                      'Last seen: '+ DateFormat('hh:mm a').format(snapshot.data!['date_time'].toDate()),
                      style: Styles.h1().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white70),
                    );
                  }
                ),

                const Spacer(),
                const SizedBox(width: 50,)
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: Styles.friendsBox(),

              child: StreamBuilder(
                stream: firestore.collection('Rooms').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                  if(snapshot.hasData) {
                    if (snapshot.data!.docs.isNotEmpty) {
                      List<QueryDocumentSnapshot?> allData = snapshot.data!.docs
                          .where((element) =>
                      element['users'].contains(widget.id) &&
                          element['users'].contains(FirebaseAuth.instance
                              .currentUser!.uid)).toList();
                      //create new variable with name data
                      QueryDocumentSnapshot? data = allData.isNotEmpty? allData.first : null;
                      ////after creating var variable
                      if (data!= null ){

                          roomId = data.id;
                          //go to the last container
                        //set state method removed
                      }
                      //if null return container

                      ////errrrrrrooooooorrrrrrrrrrr//////////////
                      return data == null? Container():StreamBuilder(
                        stream: data.reference.collection('messages').orderBy('datetime',descending: true).snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot>snap) {
                          return
                            !snap.hasData?
                          Container():
                          ListView.builder(
                            itemCount:snap.data!.docs.length,
                            reverse: true,
                            itemBuilder: (context, i) {
                              return ChatWidgets.messagesCard(snap.data!.docs[i]['sent_by'] == FirebaseAuth.instance.currentUser!.uid ,  snap.data!.docs[i]['message'],'time');
                            },
                   );
                        }
                      );
                    }
                    else{
                      return Center(
                        child: Text('No chats available ',style: Styles.h1().copyWith(color: Colors.blueGrey),),
                      );
                    }

                  }
                  else {
                    return Center (
                      child: CircularProgressIndicator(color: Colors.blueGrey,)
                    );
                  }

                },
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child:ChatWidgets.messageField(onSubmit: (controller)

            ///last
            ///
    {if (roomId != null )
    {
      Map<String,dynamic> data ={
        //create a data model
        'message' : controller.text.trim(),
        'sent_by': FirebaseAuth.instance.currentUser!.uid,
        'datetime':DateTime.now(),
      };

firestore.collection('Rooms').doc(roomId).collection('messages').add(data);
    }
    else {
      //data set
      Map<String,dynamic> data ={
        //create a data model
        'message' : controller.text.trim(),
        'sent_by': FirebaseAuth.instance.currentUser!.uid,
        'datetime':DateTime.now(),
      };
      firestore.collection('Rooms').doc(roomId).update({
'last_message_time':DateTime.now(),
        //////
        'last_message':controller.text,
      });
      firestore.collection('Rooms').add({
        'users':[widget.id,FirebaseAuth.instance.currentUser!.uid],
        ///
        'last_message_time':DateTime.now(),
        'last_message':controller.text,
      }).then((value)async{

        //method to upload the data set
        value.collection('messages').add(data);
      });
    }controller.clear();    }) ,
            //check for the condition for room  id


    // }controller.clear();
          ),

        ],
      ),
    );
  }
}
