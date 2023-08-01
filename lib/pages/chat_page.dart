
import 'dart:convert';


import 'package:chatapp/constrans.dart';
import 'package:chatapp/model/messagemodel.dart';
import 'package:chatapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/chat_bubble.dart';


class ChatPage extends StatelessWidget {

   static String id="ChatPage";
    CollectionReference messages = FirebaseFirestore.instance.collection('messages');
     TextEditingController textcontroller = TextEditingController();
      ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {

  String email = ModalRoute.of(context)!.settings.arguments as String;

    return StreamBuilder<QuerySnapshot>(
      
      stream:messages.orderBy('CreatedAt',descending:true).snapshots() ,
      builder: (context, snapshot) {


          if(snapshot.hasData)
          {
          List<MessageModel> messagelist=[];
          for(int i=0;i<snapshot.data!.docs.length;i++)
          {

              messagelist.add(MessageModel.fromFirestore(snapshot.data!.docs[i]));

          }


            return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: KPrimaryColor,
              title: Text('Chatpage'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messagelist.length,
                    itemBuilder: (context, index){
                      
                      return messagelist[index].id==email?
                      Chatbubble(msg:messagelist[index]):
                      Chatbubbleopp(msg: messagelist[index]);

                      //Chatbubbleopp(msg: messagelist[index])
          })),
               
               Padding(
                 padding: const EdgeInsets.all(18),
                 child: TextField(
                  controller: textcontroller,
                  onSubmitted: (value) {
                    messages.add(
                       {
                      "message":value,
                      "CreatedAt":DateTime.now(),
                      'id':email
                      });
                        
                      textcontroller.clear();

                      _scrollController.animateTo(
                        0,
                       duration: Duration(seconds: 1),
                        curve: Curves.easeIn);

                  },
                
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.send_sharp,color: KPrimaryColor,),
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: KPrimaryColor),
                      borderRadius: BorderRadius.circular(18)
                    ) ,
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: KPrimaryColor),
                      borderRadius: BorderRadius.circular(18)
                    )),
                  
                 )
               )
              ],
            ),
    
    
    
    
      );
          }else{
            return Scaffold(
              body: Center(child: Text('loading . . .')));
          }
      } 
    );
  }
}
