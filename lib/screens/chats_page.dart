import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance.collection('chats').snapshots().listen((data) {
      data.docs.forEach((doc) {
        print(doc['name']);
      });
    });
    return StreamBuilder(builder: (
      BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(snapshot.data.docs[index]['name']),
            subtitle: Text(snapshot.data.docs[index]['message']),
          );
        },
      );
    });
  }
}
