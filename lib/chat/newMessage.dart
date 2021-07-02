import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = new TextEditingController();
  var _enterMassage = '';

  void sendMessage() {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enterMassage,
      'createdAt': Timestamp.now(),
      'userUid': user!.uid,
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          Expanded(
            child: CupertinoTextField(
              controller: _controller,
              placeholder: 'Send',
              onChanged: (value) {
                setState(() {
                  _enterMassage = value;
                });
              },
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _enterMassage.trim().isEmpty ? null : sendMessage,
            child: Icon(
              CupertinoIcons.arrow_right_square_fill,
            ),
          ),
        ],
      ),
    );
  }
}
