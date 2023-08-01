import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main()async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( ChatApp());
}


class ChatApp extends StatelessWidget {
   ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Loginpage.id:(context) => Loginpage(),
        Registerpage.id:(context) => Registerpage(),
        ChatPage.id:(context) => ChatPage()
      },
      debugShowCheckedModeBanner: false,

        initialRoute: 'Loginpage',

    );
  }
}