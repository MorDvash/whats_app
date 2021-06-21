import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CupertinoFormSection(
                  children: [
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        placeholder: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        placeholder: 'UserName',
                      ),
                    ),
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        placeholder: 'Password',
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                CupertinoButton(child: Text('Login'), onPressed: () {}),
                CupertinoButton.filled(
                    child: Text('Create new account'), onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
