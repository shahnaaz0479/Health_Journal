import 'package:flutter/material.dart';
import 'Signup.dart';
import 'Login.dart';
import 'Homepage.dart';
 
void main() {
  runApp(new MyApp());
}
 
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Split Widgets Example',
      home: new LoginPage(),
      routes: <String,WidgetBuilder>{
        '/landingpage':(BuildContext)=>new MyApp(),
        '/signup':(BuildContext) => new SignUpPage(),
        '/homepage':(BuildContext) => new Home()
      },
    );
  }
}