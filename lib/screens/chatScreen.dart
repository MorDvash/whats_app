import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/chat/message.dart';
import 'package:whats_app/chat/newMessage.dart';
import 'package:whats_app/screens/settings.dart';

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
                  .collection('chat/YVPwJkQvvmcGl2mgw3OI/messages')
                  .add({'text': 'some text'});
            },
            child: Icon(
              CupertinoIcons.add,
            ),
          ),
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
            child: Icon(
              CupertinoIcons.person_alt_circle,
            ),
          ),
        ),
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Messages(),
              ),
              NewMessage(),
            ],
          ),
        ));
  }
}
