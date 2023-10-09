import 'package:chatapp/constrans.dart';
import 'package:chatapp/pages/cubits/register_cubit/register_cubit.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/button.dart';
import '../utilities/snackbar.dart';
import '../widgets/text.dart';
import 'chat_page.dart';

class Registerpage extends StatelessWidget {
  String? email, password;
  static String id = 'Registerpage';
  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if(state is Registersucces)
        {
          isloading = false;
          Navigator.pop(context);
        }else if(state is Registerloading){isloading=true;}
        else if(state is Registerfailure){
          isloading= false; 
          show_snakbar(context, state.err);}

      },
      child: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: KPrimaryColor,
            body: Form(
              key: formkey,
              child: ListView(children: [
                Image.asset(
                  'assets/img/scholar.png',
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chat APP",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Register ',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // text here ????
                Textinput(
                    color: Colors.white,
                    onChanged: (data) {
                      email = data;
                    },
                    hint: "Email"),

                const SizedBox(
                  height: 30,
                ),
                Textinput(
                    color: Colors.white,
                    onChanged: (data) {
                      password = data;
                    },
                    hint: "password"),

                const SizedBox(
                  height: 15,
                ),

                Button(
                  text: 'Register',
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<RegisterCubit>(context)
                          .Register_User(email: email!, password: password!);
                    }
                  },
                ),

                const SizedBox(
                  height: 17,
                ),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "i have already an account ?",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ])
              ]),
            )),
      ),
    );
  }

  Future<UserCredential> Register_User() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    return user;
  }
}
