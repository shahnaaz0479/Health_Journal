import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
 class UserManagement{
   storenewUser(user,context){
     print(user.email);
     Firestore.instance.collection('users').
     add({
       'email': user.email,
       'uid':user.uid,
     }).then((value) {
       Navigator.of(context).pop();
       Navigator.of(context).pushReplacementNamed('/homepage');
     }).
     catchError((e)
     {
       print(e);
     });
   }
 }
