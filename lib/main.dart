import 'package:flutter/cupertino.dart';
import 'package:whats_app/screens/chatScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: ChatScreen(),
    );
  }
}
