import 'package:flutter/material.dart';
import 'package:love_rekindled/model/counsellor_model.dart';
import 'package:love_rekindled/pages/discussion/chat_page.dart';
import 'package:love_rekindled/ui_items/general_ui_item.dart';

class ChooseCounsellor extends StatefulWidget {
  @override
  _ChooseCounsellorState createState() => _ChooseCounsellorState();
}

class _ChooseCounsellorState extends State<ChooseCounsellor> {
  CounsellorModel counsellorModel = CounsellorModel(
    name: "RTYUIOPOIUYUIOP",
    imageurl: "images/img1.png",
    emailAddress: "dtfuffyfuyyguiyv@gmial.com",
    about:
        "hFHJHJHGBhoHukb chihivlh  vhdfvhfl vfvd ffv fv kjfdv jdkfvjklf vbkjf vfjkv fjk vbldjkfv bfj fv dfv jfkdvkfbvkdvohsbskvb fvb dusflivfivjfbvfjv s hvfijvb fkj bdsld fjvbfbj fsb v fj vfv divh fnivkfovi dshirvkfiv foivhv fivfodvnifvf vidfh vif vif hvif vifvf bdubdfu vfdiuvf ivhfido vfdvi vodifhv fihvfio hfih fi fih fibhf ibhf bifbhfbifhfoihb fidbh dfoi bhdfio bhfdiob h ohfo ihfoih fdbh oibfhdbfh ifhb ibhhfidhb ofhbf hiohdboidfhbofihbfdoibhfbiodhfobhdfihbod fihbdoifhbi hfb hfbfhdoiboifhdobihihdoihbiofhbd    ihdihbifhd",
    schedules: "Tuesday 7pm - 9pm",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Choose Counsellor"),
      ),
      body: ListView(
        children: List.generate(
          10, // length,
          (index) => buildCounsellorTile(counsellorModel),
        ),
      ),
    );
  }

  Widget buildCounsellorTile(CounsellorModel counsellor) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        // Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (c) => ChatPage(),
          ),
        );
        // pushRoute(context, ChatPage());
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image.asset(
                counsellor.imageurl,
                width: 64,
                // height: 32,
              ),
              horizontalSpace(),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          counsellor.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    verticalSpace(),
                    Row(
                      children: <Widget>[
                        // Icon(Icons.contact_mail),
                        horizontalSpace(),
                        Text(counsellor.emailAddress),
                      ],
                    ),
                    verticalSpace(),
                    Row(
                      children: <Widget>[
                        // Icon(Icons.access_time),
                        horizontalSpace(),
                        Text(counsellor.schedules),
                      ],
                    ),
                    verticalSpace(),
                  ],
                ),
              ),
              horizontalSpace(),
            ],
          ),
        ),
      ),
    );
  }
}
