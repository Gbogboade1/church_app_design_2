import 'package:flutter/material.dart';
import 'package:love_rekindled/ui_items/general_ui_item.dart';

class ChatPage extends StatefulWidget {
  // final String name;
  // final String imgurl;

  // const ChatPage({Key key, this.name, this.imgurl}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -15.0,
        title: Row(
          children: <Widget>[
            InkWell(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                      backgroundImage: AssetImage(
                    "images/img1.jpg",
                  )),
                  horizontalSpace(),
                  Text(
                    "Name",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
        actions: <Widget>[
          // Icon(Icons.videocam),
          // Icon(Icons.call),
          // Icon(Icons.more_vert)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    // "images/img1.jpg",
                    "https://i.pinimg.com/originals/8f/ba/cb/8fbacbd464e996966eb9d4a6b7a9c21e.jpg"),
                fit: BoxFit.fitWidth)),
        child: Column(
          children: <Widget>[
            Flexible(child: Container()),
            Card(
              elevation: 0,
              color: Colors.white,
              shape: StadiumBorder(),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                        //   borderRadius:
                        //       const BorderRadius.all(const Radius.circular(64.0)),
                        // ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.black,
                      ),
                      onPressed: null)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
