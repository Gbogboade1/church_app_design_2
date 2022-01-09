import 'package:flutter/cupertino.dart';
import 'package:love_rekindled/model/search_result.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Search"),
      ),
      body: Stack(
        children: <Widget>[
          buildSearchBar(),
          Padding(
            padding: const EdgeInsets.only(
              top: 80.0,
              // bottom: 64,
            ),
            child: ListView(
              children: List.generate(
                13,
                (indeex) {
                  SearchResult s = SearchResult(
                    imageUrl: "images/img1.jpg",
                    title: "The Lord of My Heart in the time of distress.",
                    subTitle: "The love_rekindled",
                  );
                  return buildSearchResult(s);
                },
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Card(
          //     child: Row(
          //       children: <Widget>[
          //         FloatingActionButton(
          //           heroTag: UniqueKey(),
          //           onPressed: () {},
          //           child: Icon(CupertinoIcons.back),
          //         ),
          //         Expanded(child: Center(child: Text("1 / 14"))),
          //         FloatingActionButton(
          //           heroTag: UniqueKey(),
          //           onPressed: () {},
          //           child: Transform.rotate(
          //               angle: math.pi * -1, child: Icon(CupertinoIcons.back)),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  buildSearchResult(SearchResult s) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 8,
            left: 16,
            right: 16,
          ),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Image.asset(
                s.imageUrl,
                width: 60,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      s.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .apply(fontSizeFactor: 0.9),
                    ),
                    SizedBox(height: 4),
                    Text(
                      s.subTitle,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .apply(fontSizeFactor: 1.2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: .76,
          color: Colors.black,
        )
      ],
    );
  }

  buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Icon(Icons.search, color: Colors.black.withOpacity(.5)),
                    SizedBox(width: 4),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search media....."),
                      ),
                    ),
                    SizedBox(width: 4),
                    Visibility(
                      visible: true,
                      // maintainSize: true,
                      child: InkWell(
                        onTap: () {
                          controller.clear();
                        },
                        child: Icon(Icons.cancel,
                            color: Colors.black.withOpacity(.5)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
