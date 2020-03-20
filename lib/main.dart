import 'package:flutter/material.dart';
import 'package:food_app/models/user.dart';
import 'package:food_app/pages/HomePage.dart';
import 'package:food_app/pages/StarterPage.dart';
import 'package:food_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp( MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Roboto'),
        home: StarterPage(),
      ),
    );
  }
}