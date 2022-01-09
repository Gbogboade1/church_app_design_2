import 'package:love_rekindled/model/events_model.dart';
import 'package:love_rekindled/style/styles.dart';
import 'package:love_rekindled/ui_items/general_ui_item.dart';
import 'package:love_rekindled/ui_items/goto_media_icon.dart';
import 'package:flutter/material.dart';

class EventsViewPage extends StatefulWidget {
  @override
  _EventsViewPageState createState() => _EventsViewPageState();
}

class _EventsViewPageState extends State<EventsViewPage> {
  EventsModel eventsModel = EventsModel(
    title: "Watch night service 2023",
    date: "Saturday, July 28, 12:30 - 200am",
    description:
        "Jameihon n ;lnionko jkj ckldjcojdlcv jpodj poj 'j vj podvjpojovj ojv iodhviokvkldvno ;ivkndklv hiov hdviok dhvniodkvhdkvfv v fkov fv fv df v i vd v dovidvid vi vih doi vdv  d ioh oidhv iodviodvh dv divo dvov odivdv idjvod hvodvh odv odv dovi hdvodvodiv odivhdoiv hdoiv dovi dhvoidv doivdoi vodividhvihdivdvdoivihdo ihdovid oiv ndoi vdoivh d.v hc.kcfibkhfgv biluxfjkbhf bnfi b fnibhf ibf ihbifbhd k.hfb fgibh goi bfbkfhiobhif ihfhbdio oifhdiob ofdhbhfoibhod ifbhoifhbvfbohh k",
    imageUrl: "images/img1.jpg",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(eventsModel.title),
        actions: <Widget>[
          GotoMediaIcon(),
          horizontalSpace(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.share),
          )
        ],
      ),
      body: ListView(
        children: [
          Image.asset(
            eventsModel.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          verticalSpace(),
          Container(
            margin: EdgeInsets.all(0),
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          eventsModel.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          eventsModel.date,
                          style: Styles.normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      eventsModel.description,
                      softWrap: true,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
