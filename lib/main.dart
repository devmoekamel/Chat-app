import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatapp/pages/cubits/login_cubit/login_cubit.dart';
import 'package:chatapp/pages/cubits/register_cubit/register_cubit.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit())

      ],
      child: MaterialApp(
        routes: {
          Loginpage.id:(context) => Loginpage(),
          Registerpage.id:(context) => Registerpage(),
          ChatPage.id:(context) => ChatPage()
        },
        debugShowCheckedModeBanner: false,
      
          initialRoute: 'Loginpage',
      
      ),
    );
  }
}