import 'package:flutter/material.dart';
import 'package:love_rekindled/pages/discussion/choose_counsellor_page.dart';
import 'package:love_rekindled/ui_items/custom_input.dart';
import 'package:love_rekindled/ui_items/general_ui_item.dart';

class AddMembersPage extends StatefulWidget {
  @override
  _AddMembersPageState createState() => _AddMembersPageState();
}

class _AddMembersPageState extends State<AddMembersPage> {
  FocusNode focusNode;
  List<String> members = [
    "090123456789",
    "090123456789",
    "090123456789",
    "090123456789",
    "090123456789",
  ];

  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Members"),
        backgroundColor: Colors.black,
      ),
      // backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            // Center(
            //   child: Text(
            //     "Add members".toUpperCase(),
            //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            //   ),
            // ),
            verticalSpace(),
            Wrap(
              children: List.generate(
                members.length,
                (index) => buildMembers(index, members[index]),
              ),
            ),
            buildInputCard(),
            RaisedButton(
              onPressed: () {
                pushRoute(context, ChooseCounsellor());
              },
              child: Text("Proceed"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Flexible(
              child: TextFormField(
                focusNode: focusNode,
                onFieldSubmitted: (c) {
                  validateAndAdd();
                },
                controller: controller,
                maxLines: 1,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter phone number",
                    fillColor: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if (focusNode.hasPrimaryFocus) {
                    focusNode.unfocus();
                  }
                  validateAndAdd();
                },
                child: Container(
                  child: Icon(Icons.add),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  validateAndAdd() {
    var m = controller.text;
    controller.clear();
    setState(() {
      members.add(m);
    });
  }

  buildMembers(int index, String member) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text((index + 1).toString()),
              horizontalSpace(),
              Expanded(
                child: Text(
                  member,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              horizontalSpace(),
              InkWell(
                  onTap: () {
                    setState(() {
                      members.remove(member);
                    });
                  },
                  child: Icon(Icons.cancel)),
            ],
          ),
        ),
      ),
    );
  }
}
