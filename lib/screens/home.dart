import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('HOME PAGE'),backgroundColor: Colors.black,),
      body: Container(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              elevation:10,
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
              child: MaterialButton(
                height:20,
                minWidth: 300,
                child: Text('REGISTER'),onPressed: (){
                Navigator.pushNamed(context, "/reg");
                  })),
                SizedBox(height: 20),
                 Material(
              elevation:10,
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
              child: MaterialButton(
                height:20,
                minWidth: 300,
                child: Text('LOGIN'),onPressed: (){
                 Navigator.pushNamed(context, "/login");
                  })),
          ],
        ),
      ),
      
    );
  }
}