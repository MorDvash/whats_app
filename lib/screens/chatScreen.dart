import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('WhatsApp'),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('chats/YVPwJkQvvmcGl2mgw3OI/messages')
                  .add({'text': 'some text'});
            },
            child: Icon(
              CupertinoIcons.add,
            ),
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chats/YVPwJkQvvmcGl2mgw3OI/messages')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(8),
                child: Text(snapshot.data!.docs[index]['text']),
              ),
            );
          },
        ));
  }
}
