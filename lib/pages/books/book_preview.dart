import 'package:love_rekindled/model/church_item.dart';
import 'package:love_rekindled/pages/books/book_reading_page.dart';
import 'package:love_rekindled/ui_items/general_ui_item.dart';
import 'package:love_rekindled/ui_items/goto_media_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookPreviewPage extends StatefulWidget {
  final ChurchItem churchItem;

  const BookPreviewPage({Key key, this.churchItem}) : super(key: key);

  @override
  _BookPreviewPageState createState() => _BookPreviewPageState();
}

class _BookPreviewPageState extends State<BookPreviewPage> {
  ChurchItem churchItem = ChurchItem();
  @override
  void initState() {
    super.initState();
    churchItem = widget.churchItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          GotoMediaIcon(),
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    buildMediaDisplayCard(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // direction: Axis.vertical,
                        children: <Widget>[
                          Text(
                            churchItem.title,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .apply(color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            churchItem.subTitle,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyText2.apply(
                                color: Colors.white54, fontSizeFactor: 1.2),
                          ),
                          SizedBox(height: 8),
                          Text(
                            churchItem.date,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyText2.apply(
                                color: Colors.white38, fontSizeFactor: 1.1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, bottom: 16, left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                buildButton(Icons.file_download, "Download",
                                    () {
                                  pushRoute(context, BookReadingPage());
                                }),
                                SizedBox(
                                  height: 8,
                                ),
                                buildButton(Icons.share, "Share", () {}),
                              ],
                            ),
                          ),
                          Text(
                            churchItem.summaryText,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyText2.apply(
                                color: Colors.white38, fontSizeFactor: 1.1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildButton(IconData icon, String text, onPressed) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.grey.withOpacity(.3),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  buildMediaDisplayCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 16),
      child: Card(
        color: Colors.blue[800],
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: Stack(
            children: <Widget>[
              churchItem.imageUrl.isNotEmpty
                  ? Image.asset(churchItem.imageUrl,
                      height: MediaQuery.of(context).size.height * .3)
                  : SizedBox(),
              Positioned(
                bottom: 0,
                left: 0,
                child: Card(
                  color:Colors.black,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("NGN 2,000", style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
