

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';


class Textinput extends StatelessWidget {

   String?hint ;
   Function(String)?onChanged;
  Color color;
    Textinput({this.hint,this.onChanged,required this.color});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: TextFormField(
          validator: (value) {
            if(value!.isEmpty)
            {
              return "field is required";
            }
          },
        style: TextStyle(
          color: color
        ),
        
          onChanged:onChanged ,
       decoration: InputDecoration(
      
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white),
            borderRadius:BorderRadius.circular(20)
        ),

        
        ),

        ),
    );
  }
}