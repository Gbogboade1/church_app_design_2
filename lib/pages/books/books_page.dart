import 'package:love_rekindled/pages/books/book_preview.dart';
import 'package:love_rekindled/model/church_item.dart';
import 'package:flutter/material.dart';
import 'package:love_rekindled/ui_items/general_ui_item.dart';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  bool isScrolling = false;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {});
    // getList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
        await Future.delayed(Duration(seconds: 3));
        getList();
      },
      child: StreamBuilder<List<ChurchItem>>(
          stream: getList(),
          key: _key,
          initialData: null,
          builder: (context, snapshot) {
            if (snapshot == null) {
              return Card(child: Center(child: Text("Unable to fetch data")));
            } else {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                );
                // Card(
                //     color: Colors.grey.withOpacity(.1),
                //     child: Center(child: Text("No data found")));
              } else {
                List<ChurchItem> churchItemList = snapshot.data;
                return Stack(
                  children: <Widget>[
                    ListView(
                      controller: scrollController,
                      children: <Widget>[
                        Image.asset("images/img1.jpg"),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Wrap(
                            // shrinkWrap: true,
                            children: List<Widget>.generate(
                              churchItemList.length,
                              (index) {
                                ChurchItem item = churchItemList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) => BookPreviewPage(
                                                  churchItem: item,
                                                )));
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 2),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Image.asset(
                                                item.imageUrl,
                                                width: 64,
                                                // fit: BoxFit.,
                                                // height: double.infinity
                                              ),
                                              horizontalSpace(),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      item.title,
                                                      softWrap: true,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          .apply(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    verticalSpace(height: 4),
                                                    Text(
                                                      "Author: Abcdefgh Ijkmln",
                                                      softWrap: true,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          .apply(
                                                              fontSizeFactor:
                                                                  .8,
                                                              fontWeightDelta:
                                                                  -1,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    verticalSpace(height: 4),
                                                    Text(
                                                      "Price: NGN 2,0000",
                                                      softWrap: true,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          .apply(
                                                            fontSizeFactor: .8,
                                                            fontWeightDelta: -1,
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    verticalSpace(height: 4),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: .75,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: Visibility(
                        visible: isScrolling,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 3),
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: Icon(Icons.arrow_downward),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
            }
          }),
    );
  }

  Stream<List<ChurchItem>> getList() async* {
    List<ChurchItem> churchItemList = [];
    ChurchItem c = ChurchItem(
      imageUrl: "images/img1.jpg",
      title: "Leadership RoundTable Through rhe COVID-19 Crisis",
      subTitle: "Josh Patterson, Matt Chandler, and Summer Vision-Berger",
      date: "June 10, 2020",
      isDownloaded: false,
      videoUrl: "url",
      audioUrl: "url",
      summaryText:
          "In thi new (Virtual) Leadership Roundtable, Josh Patterson, Matt Chandler, and Summer Vision talks about how they are navigated the COVID 19 crisis as laders in the love_rekindled.",
    );

    for (var i = 0; i < 15; i++) {
      await Future.delayed(Duration(milliseconds: 600));
      churchItemList.add(c);
      yield churchItemList;
    }
    churchItemList = List.generate(20, (i) => c);
  }
}
