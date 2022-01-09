import 'package:love_rekindled/pages/discussion/add_members.dart';
import 'package:love_rekindled/pages/discussion/choose_counsellor_page.dart';
import 'package:love_rekindled/style/styles.dart';
import 'package:love_rekindled/model/chat_model.dart';
import 'package:love_rekindled/ui_items/chat_tile.dart';
import 'package:love_rekindled/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:love_rekindled/ui_items/general_ui_item.dart';

class CounsellingPage extends StatefulWidget {
  @override
  _CounsellingPageState createState() => _CounsellingPageState();
}

class _CounsellingPageState extends State<CounsellingPage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  List<ChatModel> allChats = [
    ChatModel(
        sender: "Jane",
        messageShort: "Hello the love of my life",
        imageUrl: "images/img1.png",
        unreads: "3",
        time: "9:30"),
    ChatModel(
        sender: "Amaka That Dissapoints",
        messageShort: "Chai ",
        imageUrl: "images/img1.png",
        time: "23:17"),
    ChatModel(
        sender: "Julian",
        messageShort: "It was awesome dear",
        imageUrl: "images/img1.png",
        unreads: "11",
        time: "Yesterday"),
    ChatModel(
        sender: "Vicky",
        messageShort: "Hehe Ray I get plenty gist ooo",
        imageUrl: "images/img1.png",
        unreads: "2",
        time: "Yesterday"),
    ChatModel(
        sender: "Jude bro",
        messageShort: "Quick Gig bro, hope you're ava... ",
        imageUrl: "images/img1.png",
        time: "01/10/2018"),
    ChatModel(
        sender: "Amaka bae",
        messageShort: "LMAO say that again ",
        imageUrl: "images/img1.png",
        time: "01/10/2018"),
    ChatModel(
        sender: "Emeka Play boy",
        messageShort: "Lol my guy something...",
        imageUrl: "images/img1.png",
        time: "02/10/2018"),
  ];

  ScrollController scrollController = ScrollController();

  var controller;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // var direction = scrollController.position.axisDirection;
    });
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      floatingActionButton: InkWell(
        onTap: () {
          buildDialogue();
        },
        child: Card(
          color: Colors.black,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/icon1.png",
                  height: 32,
                  width: 32,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Discussions"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          await Future.delayed(Duration(seconds: 3));
          getList();
        },
        child: ListView(
          controller: scrollController,
          children: List<Widget>.generate(
            allChats.length,
            (index) {
              ChatModel item = allChats[index];
              // print("${item.date}");
              return ChatTile(
                chat: item,
              ); //buildMessageCard(item);
            },
          ),
        ),
      ),
    );
  }

  buildGroupNameDialogue() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.all(16),
          title: Text("Enter Group Name"),
          titlePadding: EdgeInsets.all(16),
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: ""),
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                pushRoute(context, AddMembersPage());
              },
              child: Text("Proceed"),
            )
          ],
        );
      },
    );
  }

  buildDialogue() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          // title: Text("Choose type"),
          // titlePadding: -8,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      pushRoute(context, ChooseCounsellor());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      // color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            horizontalSpace(),
                            Text(
                              "Individual",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      buildGroupNameDialogue();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.people,
                              color: Colors.black,
                            ),
                            horizontalSpace(),
                            Text(
                              "Create Group",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<List<MessageModel>> getList() async {
    List<MessageModel> messageModelList = [];

    messageModelList.add(MessageModel(
      message: "How are you doing?",
      isRead: true,
      isDelivered: true,
      senderId: "0",
    ));
    messageModelList.add(MessageModel(
      message: "I am doing great sir",
      isRead: true,
      isDelivered: true,
      senderId: "1",
    ));
    messageModelList.add(MessageModel(
      message: "How are you doing?",
      isRead: true,
      isDelivered: true,
      senderId: "1",
    ));
    messageModelList.add(MessageModel(
      message: "How are you doing?",
      isRead: true,
      isDelivered: true,
      senderId: "0",
    ));
    messageModelList.add(MessageModel(
      message: "How are you doing?",
      senderId: "1",
    ));
    messageModelList.add(MessageModel(
      message: "How are you doing?",
      senderId: "0",
    ));
    messageModelList.add(MessageModel(
      message: "How are you doing?",
      senderId: "1",
    ));

    await Future.delayed(Duration(milliseconds: 1500));

    return messageModelList;
  }

  buildMessageCard(MessageModel m) {
    return Column(
      children: <Widget>[
        Align(
          alignment:
              m.senderId == "0" ? Alignment.centerLeft : Alignment.centerRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: m.senderId == "0"
                ? Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        // direction: Axis.vertical,
                        children: <Widget>[
                          // Text(
                          //   m.senderId,
                          //   textAlign: TextAlign.left,
                          // ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              m.message,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(m.date)),
                        ],
                      ),
                    ),
                  )
                : Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        // direction: Axis.vertical,
                        children: <Widget>[
                          // Text(
                          //   m.senderId,
                          //   textAlign: TextAlign.left,
                          // ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              m.message,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(m.date)),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
        SizedBox(
          height: 4,
        )
      ],
    );
  }
}
