import 'package:flutter/material.dart';
import 'package:whatsapp_chatbox/Model/chat_model.dart';
import 'package:whatsapp_chatbox/Screen/individual_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.chatModel,
  });
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualPage(chatModel: chatModel)));
      },
      child: Column(
        children: [
          ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Image.asset(
                  chatModel.isGroup
                      ? "assets/images/groups.png"
                      : "assets/images/person.png",
                  color: Colors.white,
                  height: 36,
                  width: 36,
                ),
              ),
              title: Text(
                chatModel.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: Text(chatModel.time),
              subtitle: Row(
                children: [
                  Icon(Icons.done_all),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    chatModel.currentMessage,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1.5,
            ),
          )
        ],
      ),
    );
  }
}
