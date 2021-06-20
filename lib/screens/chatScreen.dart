import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

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
                .snapshots()
                .listen((data) {
              data.docs.forEach((doc) {
                print(doc['text']);
              });
            });
          },
          child: Icon(
            CupertinoIcons.add,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(8),
          child: Text('its work!!'),
        ),
      ),
    );
  }
}
