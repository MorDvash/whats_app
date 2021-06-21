import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/widgets/authForm.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Future<void> _submitAuth(String email, String password, String userName,
      bool isLogin, BuildContext ctx) async {
    try {
      if (!isLogin) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
    } on FirebaseAuthException catch (e) {
      var errorMessage = '';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = e.message!;
      }
      showDialog(
          context: ctx,
          builder: (BuildContext ctx) => new CupertinoAlertDialog(
                  title: new Text("Alert"),
                  content: new Text(errorMessage),
                  actions: [
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: new Text("Okey"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ]));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: AuthForm(_submitAuth),
    );
  }
}
