

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {

   Function()?onTap;

  String text ;

  
  Button({ this.onTap , required this.text});


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap ,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 7),
          height: 50,
          width:double.infinity,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(18)),
            child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
            ),
        ),
    );
  }
}