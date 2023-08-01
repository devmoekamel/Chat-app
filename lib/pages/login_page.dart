import 'dart:developer';

import 'package:chatapp/constrans.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/button.dart';
import '../utilities/snackbar.dart';
import '../widgets/text.dart';

class Loginpage extends StatefulWidget {

 static String id  ='Loginpage';

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String?email , passsword;

  GlobalKey <FormState> loginkey= GlobalKey();

  bool isloading=false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          backgroundColor:KPrimaryColor ,
          
          body: Form(
                key: loginkey,
            child: ListView(
              children: [
              Image.asset('assets/img/scholar.png',
              height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Scholar APP",
                    style: TextStyle(
                      fontSize: 32, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                      ),
                  ),
                ],
              ),
          
             const SizedBox(
              
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'login ',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
          
              // text here ????
              Textinput(
                color: Colors.white,
                onChanged: (data) {
    
                email=data;
                
              },
                hint: "Email"),
          
             const SizedBox(
                height: 30,
              ),
              Textinput(
                color: Colors.white,
                
                onChanged: (data) {
    
                passsword=data;
                
              },hint: "password"),
          
             const  SizedBox(
                height: 15,
              ),
          
              Button(
                onTap:()async{
    
                      if(loginkey.currentState!.validate())
                      {
                        setState(() {isloading=true; });
                          try{
                                 await login_user();
                                  show_snakbar(context,'u logged in successfully');
                                  Navigator.pushNamed(context, ChatPage.id,arguments: email);

    
    
                          }on FirebaseAuthException catch(ex){
                             if (ex.code == 'user-not-found') {
                                  show_snakbar(context,'No user found for that email.');
                                } else if (ex.code == 'wrong-password') {
                                  show_snakbar(context,'Wrong password provided for that user.');
    
                                }
                          }
                            setState(() {isloading=false; });

    
    
    
    
                      }
                        
          
          
                } ,            
                text: 'sign in',),
              
                const SizedBox(
               height: 17
              ),
          
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
                    Text("i dont have an account ?",
                    style: TextStyle(
                      color: Colors.white
                    ),),
                    
                       GestureDetector(
                        onTap: () {
          
                          Navigator.pushNamed(context, Registerpage.id);                      
                        },
                         child: Text("Register",
                                       style: TextStyle(
                                         color: Colors.white
                                       ),),
                       ),
             
             ])
              
            ]),
          )),
    );
  }

  Future<UserCredential> login_user() async {
    UserCredential user =await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!, password: passsword!);

    return user;
  }
}
