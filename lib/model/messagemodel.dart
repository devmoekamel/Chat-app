import 'package:flutter/material.dart';


class MessageModel
{

final String messagetext;
final String id;

MessageModel( this.messagetext,this.id);



factory MessageModel.fromFirestore( firestoredata){



  return MessageModel(firestoredata['message'],firestoredata['id']);
}





}