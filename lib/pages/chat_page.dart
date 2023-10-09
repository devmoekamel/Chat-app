import 'dart:convert';

import 'package:chatapp/constrans.dart';
import 'package:chatapp/model/messagemodel.dart';
import 'package:chatapp/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/chat_bubble.dart';
import 'cubits/login_cubit/login_cubit.dart';

class ChatPage extends StatelessWidget {
  static String id = "ChatPage";
  List<MessageModel> messagelist = [];

  TextEditingController textcontroller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    String email = BlocProvider.of<LoginCubit>(context).email as String;

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
              child: BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              print(email);
              print(messagelist);
              if (state is ChatSuccess) {
                messagelist = state.messagelist;
                // print(email);
              }
            },
            builder: (context, state) {
              return ListView.builder(
                  reverse: true,
                  controller: _scrollController,
                  itemCount: messagelist.length,
                  itemBuilder: (context, index) {
                    return messagelist[index].id == email
                        ? Chatbubble(msg: messagelist[index])
                        : Chatbubbleopp(msg: messagelist[index]);

                    //Chatbubbleopp(msg: messagelist[index])
                  });
            },
          )),
          Padding(
              padding: const EdgeInsets.all(18),
              child: TextField(
                controller: textcontroller,
                onSubmitted: (value) {
//send msg code here
                  BlocProvider.of<ChatCubit>(context)
                      .sendMessage(message: value, email: email);

                  textcontroller.clear();

                  _scrollController.animateTo(0,
                      duration: Duration(seconds: 1), curve: Curves.easeIn);
                },
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.send_sharp,
                      color: KPrimaryColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: KPrimaryColor),
                        borderRadius: BorderRadius.circular(18)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: KPrimaryColor),
                        borderRadius: BorderRadius.circular(18))),
              ))
        ],
      ),
    );
  }
}
