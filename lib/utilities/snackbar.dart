 
 import 'package:flutter/material.dart';
 
  void show_snakbar(BuildContext context, String content) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
      content:Text(content),
      backgroundColor:Colors.red ,
      
       ));
  }
