import 'package:flutter/material.dart';
import 'package:food_app/animations/FadeAnimation.dart';
import 'package:food_app/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Image.asset(
              'assets/images/grapevine.jpg',
              width: 600,            
              height: 140,            
              fit: BoxFit.cover,
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 10.0),
              child: Text(
                'Welcome To GrapeVine',
                textAlign: TextAlign.left,
                style:TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: .5, horizontal: 10.0),
              child: Text(
                'Sign Up to continue',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'assets/fonts/Roboto-Regular.ttf',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400]
                )
              )
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: .5,horizontal: 10.0),
              child: SignupForm(),
            )
          ],
          )
        ),
      );
  }
}
      // Create a Form Widget
class SignupForm extends StatefulWidget{
  @override
  SignupFormState createState(){
    return SignupFormState();
  }
}

class SignupFormState extends State<SignupForm>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return 'Please Enter a password';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HomePage()));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}