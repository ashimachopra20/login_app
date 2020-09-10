import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Mylogin extends StatefulWidget {
  @override
  _MyloginState createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  @override
  bool sspin=false;
   var f =FirebaseAuth.instance;
String email;
String password;
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title:Text("LOGIN")),
      body:  ModalProgressHUD(
        inAsyncCall: sspin,
              child: Container(
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
                sspin=true;
                
                try{
                var signin= await f.signInWithEmailAndPassword(email: email, password: password);
                print(signin);
                   if(signin!=null){
                  Navigator.popAndPushNamed(context, "/chat");
                  } 
                } catch(e){
                print(e);
                }
                  } ,child:Text("LOG ME IN"), color: Colors.red,
               ),
             ],
    ),
         ),
      ));
  }}