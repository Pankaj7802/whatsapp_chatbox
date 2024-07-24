import 'package:flutter/material.dart';
import 'package:whatsapp_chatbox/CustomUI/custom_card.dart';
import 'package:whatsapp_chatbox/Model/chat_model.dart';

class ChatsPage extends StatefulWidget {
  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<ChatModel> chats = [
    ChatModel("Pankaj", "person.png", false, "hii Everyone", "18:55"),
    ChatModel("Rahul", "person.png", false, "hii Everyone", "18:55"),
    ChatModel("Manish", "person.png", false, "hii Everyone", "18:55"),
    ChatModel("Ramesh", "person.png", false, "hii Everyone", "18:55"),
    ChatModel("Sachin", "person.png", false, "hii Everyone", "1855"),
    ChatModel("Rakesh", "person.png", false, "hii Everyone", "18:55"),
    ChatModel("Prince", "person.png", false, "hii Everyone", "18:55"),
    ChatModel("Manoj", "person.png", false, "hii Everyone", "18:55"),
    ChatModel("Sanjay", "person.png", false, "hii Everyone", "18:55"),
    ChatModel("Akash", "person.png", false, "hii Everyone", "1855"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}
