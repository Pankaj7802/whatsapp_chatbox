import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_chatbox/Model/chat_model.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel});

  final ChatModel chatModel;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  TextEditingController _controller = TextEditingController();
  bool show = false;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Color(0xFF128C7E),
          leadingWidth: 70,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                  child: SvgPicture.asset(
                    widget.chatModel.isGroup
                        ? "assets/images/groups.png "
                        : "assets/images/person.png ",
                    height: 36,
                    width: 36,
                    color: Colors.white,
                  ),
                  radius: 20,
                  // backgroundColor: Colors.blueAccent,
                ),
              ],
            ),
          ),
          title: Container(
            margin: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                ),
                Text(
                  "last seen today at 12:05 ",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.videocam,
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.call),
            ),
            PopupMenuButton(
                onSelected: (value) => print(value),
                itemBuilder: (BuildContext contex) {
                  return [
                    PopupMenuItem(
                      child: Text("Group info"),
                      value: "Group info",
                    ),
                    PopupMenuItem(
                      child: Text("Group media"),
                      value: "Group media",
                    ),
                    PopupMenuItem(
                      child: Text("Search"),
                      value: "Search",
                    ),
                    PopupMenuItem(
                      child: Text("Mute notifications"),
                      value: "Mute notifications",
                    ),
                    PopupMenuItem(
                      child: Text("Disappearing messages"),
                      value: "Disappearing messages",
                    ),
                    PopupMenuItem(
                      child: Text("Wallpaper"),
                      value: "Wallpaper",
                    ),
                    PopupMenuItem(
                      child: Text("More"),
                      value: "More",
                    ),
                  ];
                })
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
            child: Stack(
              children: [
                ListView(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 100,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      prefixIcon: IconButton(
                                        onPressed: () {
                                          focusNode.unfocus();
                                          focusNode.canRequestFocus = false;
                                          setState(() {
                                            show = !show;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.emoji_emotions,
                                        ),
                                      ),
                                      prefixIconColor: Color(0xFF128C7E),
                                      suffixIconColor: Color(0xFF128C7E),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.attach_file),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                  Icons.currency_rupee_sharp)),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.camera_alt,
                                            ),
                                          ),
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.all(5),
                                    ),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 2, right: 2, bottom: 8),
                            child: CircleAvatar(
                                backgroundColor: Color(0xFF128C7E),
                                radius: 25,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.mic,
                                      color: Colors.white,
                                    ))),
                          )
                        ],
                      ),
                      show ? emojiPicker() : Container(),
                    ],
                  ),
                )
              ],
            ),
            onWillPop: () {
              if (show) {
                setState(() {
                  show = false;
                });
              } else {
                Navigator.pop(context);
              }
              return Future.value(false);
            }),
      ),
    );
  }

  Widget emojiPicker() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        print(emoji);
        setState(() {

          _controller.text = _controller.text ;
        });
      },
    );
  }
}
