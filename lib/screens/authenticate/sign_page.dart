
import 'package:flutter/material.dart';
import 'package:todo_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        title: Text('Sign in to add todos'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 150.0),
        child: RaisedButton(
          color: Colors.orange,
          child: Text('sign in anon',
                style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if(result == null){
              print('error signing in');
            } else {
              print('signed in');
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}