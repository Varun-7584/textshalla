import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:textshalla/main.dart';
import 'package:textshalla/chating/chatpage.dart';
import 'package:textshalla/comps/styles.dart';
import 'package:textshalla/comps/widgets.dart';
import 'package:textshalla/func/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const String id = 'homepage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void initState(){
    // Function.updateAvailability();
  }

  bool open  = false;
  //instance of firestore
  final firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade400,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        title: const Text('Textshalla'),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    open == true? open = false: open = true;
                  });
                },
                icon:  Icon(
                  open == true? Icons.close_rounded :Icons.search_rounded,
                  size: 30,
                )),
          )
        ],
      ),
      drawer: ChatWidgets.drawer(),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(0),
                  child: Container(
                    color: Colors.indigo.shade400,
                    padding: const EdgeInsets.all(8),
                    height: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10),
                          child: Text(
                            'Recent Users',
                            style: Styles.h1(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 80,
                          child: StreamBuilder(
                            stream: firestore.collection('Rooms').snapshots(),
                            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                              //to get recent chats
                              List data = !snapshot.hasData? [] :snapshot.data!.docs.where((element) => element['users'].toString().contains(FirebaseAuth.instance.currentUser!.uid)).toList();
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                //pass length of the data as item
                                itemCount: data.length,
                                itemBuilder: (context, i) {
                                  List users = data[i]['users'];
                                  var friend = users.where((element)=>element != FirebaseAuth.instance.currentUser!.uid);
                                  var user = friend.isNotEmpty ? friend.first : users .where((element)=>element ==FirebaseAuth.instance. currentUser!.uid).first ;
                                  return FutureBuilder(
                                    future: firestore.collection('Users').doc(user).get(),
                                    builder: (context, AsyncSnapshot snap) {
                                      return ChatWidgets.circleProfile(onTap: (){

                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)
                                        {return ChatPage(id: user,name:snap.data['name']);
                                          }),

                                        );
                                      },name: snap.data['name']);
                                    }
                                  );
                                },
                              );
                            }

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: Styles.friendsBox(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text(
                            'Contacts',
                            style: Styles.h1().copyWith(color: Colors.indigo),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: StreamBuilder(
                              stream: firestore.collection('Rooms').snapshots(),
                              builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                                //to get the rooms
                                List data = !snapshot.hasData?[]: snapshot.data!.docs.where((element)=>element['users'].toString().contains(FirebaseAuth.instance.currentUser!.uid)).toList();
                                return ListView.builder(
                                  //pass the length of the data
                                  itemCount: data.length,
                                  itemBuilder: (context, i) {
                                    List users = data[i]['users'];
                                    var friend = users.where((element)=>element != FirebaseAuth.instance.currentUser!.uid);
                                    var user = friend.isNotEmpty ? friend.first : users .where((element)=>element ==FirebaseAuth.instance. currentUser!.uid).first ;
                                    return FutureBuilder(
                                      future: firestore.collection('Users').doc(user).get(),
                                      builder: (context,AsyncSnapshot snap) {
                                        return
                                          !snap.hasData? Container():ChatWidgets.card(
                                          title: snap.data['name'],
                                          subtitle: 'Hello !',
                                          time: '12;00',
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return ChatPage(
                                                    id: user,
                                                    name :snap.data['name'],
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    );
                                  },
                                );
                              }
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ChatWidgets.searchBar(open)
          ],
        ),
      ),
    );
  }
}
