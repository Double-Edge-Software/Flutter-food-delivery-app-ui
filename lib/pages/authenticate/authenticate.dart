import 'package:flutter/material.dart';
import 'package:food_app/pages/authenticate/sign-in.dart';

class Authenticate extends StatefulWidget{
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:SignIn(),
    ); 
  }
}