import 'package:flutter/material.dart';
import 'package:whatsapp/pages/call_screen.dart';
import 'package:whatsapp/pages/camera_screen.dart';
import 'package:whatsapp/pages/chat_screen.dart';
import 'package:whatsapp/pages/setting_screen.dart';
import 'package:whatsapp/pages/status_screen.dart';
import 'package:whatsapp/pages/create_chat_screen.dart';


class WhatsAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new WhatsAppHomeState();

}

class WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  TabController tabController;
  Map<String , SliverAppBar> appBarList;
  String _currentAppBar  = 'mainAppBar';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = new TabController(initialIndex: 1,length: 4, vsync: this);

    SliverAppBar mainAppBar = new SliverAppBar(
      title: new Text("واتساپ"),
      pinned: true,
      floating: true,
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
        new GestureDetector(
          child: new Icon(Icons.search),
          onTap: () {
            setState(() {
              _currentAppBar = 'searchAppBar';
            });
          },
        ),
        new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5)
        ),
        new PopupMenuButton<String>(
            onSelected: (String choice) {
              if(choice == 'settings') {
                Navigator.pushNamed(context, "/settings");
              } else if(choice == 'new_group') {
                // Navigator push to new Group
              }
            } ,
            itemBuilder: (BuildContext context) {
              return [
                new PopupMenuItem(
                    value: 'new_group',
                    child:  new Row(
                      mainAxisAlignment:  MainAxisAlignment.end,
                      children: <Widget>[
                        new Text('گروه جدید')
                      ],
                    )
                ),
                new PopupMenuItem(
                    value: 'settings',
                    child: new Row(
                      mainAxisAlignment:  MainAxisAlignment.end,
                      children: <Widget>[
                        new Text('تنظیمات')
                      ],
                    )
                )
              ];
            }
        )
      ],
    );
    SliverAppBar searchAppBar = new SliverAppBar(
      title: new TextField(
        decoration: new InputDecoration(
          border:  InputBorder.none,
          hintText: "جستجو ..."
        ),
      ),
      pinned: true,
      elevation: 5,
      backgroundColor: Colors.white,
      leading: new GestureDetector(
        child:  new Padding(
          padding: const EdgeInsets.only(right: 12),
          child:  new Icon(Icons.arrow_back , color : new Color(0xff075E54)),
        ),
        onTap: () {
         setState(() {
            _currentAppBar = 'mainAppBar';
         });
        },
      ),
    );

    appBarList = <String , SliverAppBar>{
      'mainAppBar' : mainAppBar,
      'searchAppBar' : searchAppBar
    };
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                appBarList[_currentAppBar]
              ];
          },
          body: _currentAppBar == 'mainAppBar'
            ? new TabBarView(
              controller: tabController,
              children: <Widget>[
                new CameraScreen(),
                new ChatScreen(),
                new StatusScreen(),
                new CallScreen()
              ]
          ) :
            new Center(
              child: new Text('Search'),
            )
          ,
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(Icons.message , color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, "/new_chat");
        }
      ),
    );
  }

}