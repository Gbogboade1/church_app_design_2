import 'package:love_rekindled/model/body_item.dart';
import 'package:love_rekindled/pages/get_connected/events_page.dart';
import 'package:love_rekindled/pages/get_connected/share_story.dart';
import 'package:love_rekindled/pages/prayer_request_page.dart';
import 'package:love_rekindled/ui_items/body_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_rekindled/ui_items/general_ui_item.dart';

class GetConnectedPage extends StatefulWidget {
  @override
  _GetConnectedPageState createState() => _GetConnectedPageState();
}

class _GetConnectedPageState extends State<GetConnectedPage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<BodyItem> bodyItemList = [
      BodyItem(
        color: Colors.orange,
        icon: Icons.calendar_today,
        title: "Upcoming Events",
        page: UpcommingEvents(),
      ),
      BodyItem(
        color: Colors.deepOrange,
        icon: CupertinoIcons.heart,
        title: "Prayer Requests",
        page: PrayerRequestPage(),
      ),
      BodyItem(
        color: Colors.blue,
        icon: CupertinoIcons.person,
        title: "Share Your Story",
        page: ShareStory(),
      ),
      BodyItem(
          color: Colors.red,
          icon: Icons.people,
          title: "Find us on Social Media",
          page: null //SociaMediaPage(),
          ),
    ];

    return Scaffold(
      key: _key,
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "images/img1.jpg",
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                    left: 16,
                    bottom: 16,
                    child: Text(
                      "Get\nConnected",
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 42,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
          Wrap(
            children: List.generate(bodyItemList.length, (index) {
              BodyItem item = bodyItemList[index];
              return InkWell(
                  onTap: () {
                    if (item.page == null) {
                      print("Show snack");
                      _key.currentState.showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.transparent,
                          content: Column(
                            children: <Widget>[
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  print("Tap recieved");
                                  _key.currentState.hideCurrentSnackBar();
                                  // Navigator.pop(context);
                                },
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              )),
                              Wrap(
                                children: <Widget>[
                                  Card(
                                    child: ListTile(
                                      leading: Icon(Icons.card_giftcard),
                                      title: Text("Instagram"),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      leading: Icon(Icons.card_giftcard),
                                      title: Text("Facebook"),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      leading: Icon(Icons.card_giftcard),
                                      title: Text("Twitter"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                      return;
                    }
                    pushRoute(context, item.page);
                  },
                  child: BodyItemTile(item: item));
            }),
          )
        ],
      ),
    );
  }
}
