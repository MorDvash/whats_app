import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/widgets/pickerImage.dart';

class AuthForm extends StatefulWidget {
  final Function _submitAuth;
  final bool _isLoading;

  AuthForm(this._submitAuth, this._isLoading);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _email = '';
  var _userName = '';
  var _password = '';

  void _login() {
    bool isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget._submitAuth(_email, _password, _userName, _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget._isLoading
          ? CupertinoActivityIndicator()
          : Card(
              margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (!_isLogin) PickerImage(),
                        CupertinoFormSection(
                          header: Text(_isLogin ? 'SignIn' : 'SignUp'),
                          children: [
                            CupertinoFormRow(
                              child: CupertinoTextFormFieldRow(
                                key: ValueKey('email'),
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return 'Please enter valid email';
                                  }
                                  return null;
                                },
                                placeholder: 'Email Address',
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (value) => _email = value as String,
                              ),
                            ),
                            if (!_isLogin)
                              CupertinoFormRow(
                                child: CupertinoTextFormFieldRow(
                                  key: ValueKey('userName'),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 2) {
                                      return 'Please enter name with at least 2 characters';
                                    }
                                    return null;
                                  },
                                  placeholder: 'UserName',
                                  onSaved: (value) =>
                                      _userName = value as String,
                                ),
                              ),
                            CupertinoFormRow(
                              child: CupertinoTextFormFieldRow(
                                key: ValueKey('password'),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 7) {
                                    return 'Please enter password with at least 7 characters';
                                  }
                                  return null;
                                },
                                placeholder: 'Password',
                                obscureText: true,
                                onSaved: (value) => _password = value as String,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        CupertinoButton(
                            child: Text(_isLogin ? 'Login' : 'SignUp'),
                            onPressed: _login),
                        CupertinoButton.filled(
                            child: Text(_isLogin
                                ? 'Create new account'
                                : 'I have already account'),
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
