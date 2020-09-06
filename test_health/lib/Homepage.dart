import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_health/tester.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Homepage();
  }

}


class Homepage extends State<Home>{

  var _myColorOne = Colors.grey;
  var _myColorTwo = Colors.grey;
  var _myColorThree = Colors.grey;
  var _myColorFour = Colors.grey;
  var _myColorFive = Colors.grey;

  final databaseReference = Firestore.instance;
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  var temp=0;

  void sendData(String a, String b, int c, String d) async
  {
    var now = new DateTime.now();
    await databaseReference.collection("user").document(mainuid).collection("data").add(
       {
         'Time':now,
         'Food':a,
         'Physical':b,
         'Mental': c,
         'Symptoms':d,
       }
     );
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: new ListView(
        children:<Widget>[
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: myController1,
                  decoration:new InputDecoration(
                    hintText:"What all did you eat?",
                    labelText: "Food",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  )
                ),
                new Padding(padding: new EdgeInsets.only(top:20.0),),
                 new TextField(
                   controller: myController2,
                  decoration:new InputDecoration(
                    hintText:"What all did you do?",
                    labelText: "Physical Activities?",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  )
                ),
                new Padding(padding: new EdgeInsets.only(top:20.0),),
                 new TextField(
                   controller: myController4,
                  decoration:new InputDecoration(
                    hintText:"Any illness?",
                    labelText: "Symptoms",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  )
                ),
                new Padding(padding: new EdgeInsets.only(top:20.0),),
                Container(
                  child: new Row(
                    children: <Widget>[
                      Padding(padding: new EdgeInsets.only(left:14.0)),
                      new Text("Mental State", style: TextStyle( fontSize:20),),
                  new IconButton(icon: new Icon(Icons.star),
                    onPressed: ()=>setState((){
                      _myColorOne=Colors.blue;
                      _myColorTwo=null;
                      _myColorThree=null;
                      _myColorFour=null;
                      _myColorFive=null;
                      temp=1;
                  }),color: _myColorOne,),
                  new IconButton(icon: new Icon(Icons.star),
                    onPressed: ()=>setState((){
                      _myColorOne=Colors.blue;
                      _myColorTwo=Colors.blue;
                      _myColorThree=Colors.grey;
                      _myColorFour=Colors.grey;
                      _myColorFive=Colors.grey;
                      temp=2;
                  }),color: _myColorTwo,),
                  new IconButton(icon: new Icon(Icons.star), onPressed: ()=>setState((){
                    _myColorOne=Colors.blue;
                    _myColorTwo=Colors.blue;
                    _myColorThree=Colors.blue;
                    _myColorFour=Colors.grey;
                    _myColorFive=Colors.grey;
                    temp=3;
                  }),color: _myColorThree,),
                  new IconButton(icon: new Icon(Icons.star), onPressed: ()=>setState((){
                    _myColorOne=Colors.blue;
                    _myColorTwo=Colors.blue;
                    _myColorThree=Colors.blue;
                    _myColorFour=Colors.blue;
                    _myColorFive=Colors.grey;
                    temp=4;
                  }),color: _myColorFour,),
                  new IconButton(icon: new Icon(Icons.star), onPressed: ()=>setState((){
                    _myColorOne=Colors.blue;
                    _myColorTwo=Colors.blue;
                    _myColorThree=Colors.blue;
                    _myColorFour=Colors.blue;
                    _myColorFive=Colors.blue;
                    temp=5;
                  }),color: _myColorFive,),
              ],  
                  ),
                ),
              
                
                new Padding(padding: new EdgeInsets.only(top:20.0),),
              
                new RaisedButton(
                  child: new Text("Submit"),
                   onPressed: ()
                 {
                  
                  sendData(myController1.text, myController2.text,temp,myController4.text);
                  Navigator.of(context).pushReplacementNamed('/homepage');
                 },
                ),
                new RaisedButton(
                  child: new Text("Logout"),
                   onPressed: ()
            {
            FirebaseAuth.instance.signOut().
            then((vale){
            Navigator.of(context).pushReplacementNamed('/landingpage');
            }).
            catchError((e){
              print(e);
            });
          },
                )
              ]
            ),
          )
        ]
      ),
      
      
    );
    
  }
  
}
