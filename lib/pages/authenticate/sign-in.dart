import 'package:flutter/material.dart';
import 'package:food_app/pages/HomePage.dart';
import 'package:food_app/pages/authenticate/register.dart';
import 'package:food_app/services/auth.dart';
import 'package:page_transition/page_transition.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

// State placeholders - text field state
String email = '';
String password = '';


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
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: () => widget.toggleView(),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        
        child: Form(
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
              onChanged: (val){
                setState(() => email = val);
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              color: Colors.pink[400],
              child: Text("Sign In with email"),
              onPressed: () async {
                print(email);
                print(password);
              },
            ),
            RaisedButton(
            child: Text('Sign In Anon') ,
            onPressed: () async {
            dynamic result =  await _auth.signInAnon();
            if (result == null){
              print('error signing in');
            } else {
              print('signed in');
              print(result);
              Navigator.push(context, PageTransition(type:PageTransitionType.fade, child: HomePage()));
              }
             } ,
            ),
          ],
          ),
        )
        )
    );
  }
}