
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_health/tester.dart';
import 'tester.dart';
class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => new _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage> {
  
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  
  void _formChange() async{
    // FirebaseAuth.instance.createUserWithEmailAndPassword(
    //   email: _emailFilter.text.trim(), password: _passwordFilter.text).then((signedInUser)
    //   async {
    //     //UserManagement().storenewUser(signedInUser,context);
    //     await databaseReference.collection("user")
    //     .document("info")
    //     .setData({
    //       'uid': 'test',
    //     });
    //      await databaseReference.collection("Health")
    //     .add({
    //       'uid':'test',
    //     });
    //     Navigator.of(context).pushReplacementNamed('/homepage');
    //   }).catchError((e)
    //   {print (e);
    //   });

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailFilter.text.trim(), password: _passwordFilter.text);
     //await databaseReference.collection("user").document(result.user.uid).setData(
       //{
         //'uid': result.user.uid,
       //}
     //);
     Navigator.of(context).pushReplacementNamed('/homepage');
     mainuid = result.user.uid;
    
  }

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
              onPressed: _formChange,
            ),
          ]
        )
      )
    );
  }

}