import 'package:flutter/material.dart';
import 'package:food_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Grape Vine'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign In Anon') ,
          onPressed: () async {
           dynamic result =  await _auth.signInAnon();
           if (result == null){
             print('error signing in');
           } else {
             print('signed in');
             print(result);
             print(result.uid);
           }
          } ,
          ),
        )
    );
  }
}