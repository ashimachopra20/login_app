import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Myreg extends StatefulWidget {
  @override
  _MyregState createState() => _MyregState();
}

class _MyregState extends State<Myreg> {
  @override
  var f =FirebaseAuth.instance;
  String email;
  var e;
  String password;
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(title:Center(child:Text('REGISTRATION'))),
      body:
       Container(
         child: Column(
           mainAxisAlignment:MainAxisAlignment.center,
          
           children: <Widget>
           [
            
             TextField(
               decoration:InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),hintText:('Enter your email') ),
               onChanged: (value){
                email= value;
               },
               keyboardType: TextInputType.emailAddress,
               
             ),
             SizedBox(height: 20),
              TextField(
                 decoration:InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),hintText:('Enter your password') ),
               onChanged: (value){
                 password= value;
               },
               obscureText: true,
               
             ),
             RaisedButton(padding: EdgeInsets.all(10),onPressed: () async {
              try{
              var user= await  f.createUserWithEmailAndPassword(email: email, password: password);
              print(user);
                 if(user.additionalUserInfo.isNewUser==true){
                Navigator.popAndPushNamed(context, "/chat");
                } 
              } catch(e){
              print(e);
              }
                } ,child:
                    Text("Register me"), 
   color: Colors.red,
             ),
           ],
    ),
       ));
  }}