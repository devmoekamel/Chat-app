
import 'package:chatapp/model/messagemodel.dart';
import 'package:flutter/material.dart';

import '../constrans.dart';


class Chatbubble extends StatelessWidget {
  

  final MessageModel msg ;

 Chatbubble({required this.msg});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,

      child: Container(
       margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
       padding: EdgeInsets.all(16),
            
       child: Text(
         msg.messagetext,
         style: TextStyle(color: Colors.white,fontSize: 16),
       ),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
           topRight: Radius.circular(20),
           bottomLeft: Radius.circular(20),
           topLeft: Radius.circular(20)),
         color: Colors.deepPurpleAccent,
       ),
              ),
    );
  }
}



class Chatbubbleopp extends StatelessWidget {
  

 final MessageModel msg ;

 Chatbubbleopp({required this.msg});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,

      child: Container(
       margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
       padding: EdgeInsets.all(16),
            
       child: Text(
         msg.messagetext,
         style: TextStyle(color: Colors.white,fontSize: 16),
       ),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
           topRight: Radius.circular(20),
           bottomRight: Radius.circular(20),
           topLeft: Radius.circular(20)),
         color: KPrimaryColor,
       ),
              ),
    );
  }
}