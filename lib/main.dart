import 'package:flutter/material.dart';
import 'package:whatsapp_chatbox/Pages/chats_page.dart';
import 'package:whatsapp_chatbox/Screen/home_screen.dart';

import 'Screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Color(0xFF075E54), // WhatsApp primary green color
        // accentColor: Color(0xFF128C7E)  // WhatsApp secondary green color
      ),
      home: HomeScreen(),

      // home: ChatsPage(),
    );
  }
}
