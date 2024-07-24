import 'package:flutter/material.dart';
import 'package:whatsapp_chatbox/Pages/chats_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF128C7E),
        title: Text("WhatsApp Clone"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('New group'),
                value: "New group",
              ),
              PopupMenuItem(
                child: Text('New broadcast'),
                value: "New broadcast",
              ),
              PopupMenuItem(
                child: Text('Whatsapp web'),
                value: "Whatsapp web",
              ),
              PopupMenuItem(
                child: Text('Starred messages'),
                value: "Starred messages",
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: "Settings",
              ),
            ];
          })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: 'CALLS',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text("Camera"),
          ChatsPage(),
          Text("Status"),
          Text("Calls"),
        ],
      ),
    );
  }
}
