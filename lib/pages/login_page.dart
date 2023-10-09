import 'dart:developer';

import 'package:chatapp/constrans.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/button.dart';
import '../utilities/snackbar.dart';
import '../widgets/text.dart';
import 'cubits/login_cubit/login_cubit.dart';

class Loginpage extends StatelessWidget {
  String? email, passsword;
  static String id = "Loginpage";
  GlobalKey<FormState> loginkey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is Loginsuccess) {
          BlocProvider.of<ChatCubit>(context).Readmessage();
          Navigator.pushNamed(context, ChatPage.id);
          isloading = false;
        } else if (state is Loginloading) {
          isloading = true;
        } else if (state is Loginfailure) {
          isloading = false;
          show_snakbar(context, state.err);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: KPrimaryColor,
            body: Form(
              key: loginkey,
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
                      email = data;
                    },
                    hint: "Email"),

                const SizedBox(
                  height: 30,
                ),
                Textinput(
                    color: Colors.white,
                    onChanged: (data) {
                      passsword = data;
                    },
                    hint: "password"),

                const SizedBox(
                  height: 15,
                ),

                Button(
                  onTap: () async {
                    if (loginkey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context)
                          .login_user(email: email!, passsword: passsword!);
                      BlocProvider.of<LoginCubit>(context).email = email!;
                    }
                  },
                  text: 'sign in',
                ),

                const SizedBox(height: 17),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "i dont have an account ?",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Registerpage.id);
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ])
              ]),
            )),
      ),
    );
  }

  Future<UserCredential> login_user() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: passsword!);

    return user;
  }
}
