import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class Mychat extends StatefulWidget {
  @override
  _MychatState createState() => _MychatState();
}

class _MychatState extends State<Mychat> {
  void initState(){
    print('Landed to chat page');
    super.initState;
  }
  String chatmsg;
  var fs=FirebaseFirestore.instance;
   var authc =FirebaseAuth.instance;
   var msgTextController= TextEditingController();
  //var fscollection=fs.collection("chat");
  String msg;

 
   
  
  @override
  
  Widget build(BuildContext context) {
   
    var myicon=Icon(Icons.cancel, color: Colors.yellow,);
    var user=authc.currentUser.email;
    var devicewidth=MediaQuery.of(context).size.width;
    var deviceheight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
          actions: <Widget>[
      IconButton(icon: myicon, onPressed:(){
        authc.signOut();
         Navigator.pushNamed(context, "/login");
      })
    ],
        title:Text('CHATTING PAGE'),),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
          
            stream: fs.collection("chat").snapshots(),
             builder: (context,snapshot){
               print('new data coming');
               var msg=snapshot.data.docs;
              // print(msg[0].data);
              List<Text> y=[];
              for(var d in msg){
                var msgSender=d.data()['sender'];
                var msgText=d.data()['text'];
              
                var msgWidget=Text("$msgText : $msgSender");
                y.add(msgWidget);
              }
              print(y);
                 

               return Container(
                 width:deviceheight*0.2,
                 child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                 children:y,
               ));
                }),
               
              
            

              Row(
                        children:<Widget>[ Container(
                     width:devicewidth*0.60,
                            child: TextField(
                      decoration: InputDecoration(hintText:"Enter your message..."),
                    controller: msgTextController,
                    
                      
                      onChanged:(value){
                      chatmsg=value;
                    }),
                  ),Container(
                     width:devicewidth*0.30,
                child:  FlatButton(onPressed: 
                ()async{
                  msgTextController.clear();
                 await  fs.collection("chat").add({
"text": chatmsg,
"sender":user
                  });
                }, child: Text("Send")))]
              ),
            ],
          ),
        ),
        
        
    
    );
  }
}