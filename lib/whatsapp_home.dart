import 'package:flutter/material.dart';
import 'package:whatsapp/pages/call_screen.dart';
import 'package:whatsapp/pages/camera_screen.dart';
import 'package:whatsapp/pages/chat_screen.dart';
import 'package:whatsapp/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new WhatsAppHomeState();

}

class WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  TabController tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = new TabController(initialIndex: 1,length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("واتساپ"),
        elevation: 5,
        bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.camera_alt)),
              new Tab(text: "چت ها"),
              new Tab(text: "وضعیت"),
              new Tab(text: "تماس ها")
            ]
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5)
          ),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
          controller: tabController,
          children: <Widget>[
            new CameraScreen(),
            new ChatScreen(),
            new StatusScreen(),
            new CallScreen()
          ]
      ),
    );
  }

}