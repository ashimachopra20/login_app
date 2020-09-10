import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/home.dart';
import 'screens/reg.dart';
import 'screens/login.dart';
import 'screens/chat.dart';

void main() {
  
WidgetsFlutterBinding.ensureInitialized();
Firebase.initializeApp(); 
  runApp(MaterialApp(
     theme: ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    accentColor: Colors.black,

    // Define the default font family.
    fontFamily: 'Georgia',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  )
,
    initialRoute: "/",
    routes: {
      "/":(context)=> Myhome(),
      "/reg":(context)=> Myreg(),
      "/login":(context)=> Mylogin(),
      "/chat":(context)=> Mychat(),

    },
    debugShowCheckedModeBanner: false,
  ));
}

