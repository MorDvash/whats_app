import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/cart';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Sample Code'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pop();
          },
          child: Text('logout'),
        ),
      ),
    );
  }
}
