
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'tester.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child:new Column(
          children: <Widget>[
            new Container(
              child:new TextField(
                controller: _emailFilter,
                decoration: new InputDecoration(
                labelText: 'Email'
              ),
              )
            ),
            new Container(
              child:new TextField(
                obscureText: true,
                controller: _passwordFilter,
                decoration: new InputDecoration(
                labelText: 'Password'
              ),
              )
            ),
            new RaisedButton(
              child: new Text('Submit'),
              onPressed:(){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _emailFilter.text.trim(),
                   password: _passwordFilter.text
                   ).then((user) async {
                     final FirebaseUser user = await auth.currentUser();
                         final uid = user.uid;
                         mainuid=uid;
                     Navigator.of(context).pushReplacementNamed('/homepage');
                   }).
                   catchError((e){
                     print(e);
                   });
              }
            ),
            new RaisedButton(
              child: new Text('Sign Up'),
              onPressed: (){
                Navigator.of(context).pushNamed('/signup');
              },
            ),
          ]
        )
      )
    );
  }

}