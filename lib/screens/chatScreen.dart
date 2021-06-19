import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('WhatsApp'),
        ),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(8),
                  child: Text('its work!!'),
                )));
  }
}
