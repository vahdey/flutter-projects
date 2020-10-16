import 'package:flutter/material.dart';
import 'package:whatsapp/pages/camera_screen.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('تنظیمات'),
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("تنظیمات" , style: TextStyle(fontSize: 20)),
                new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  } ,
                  child: new Text('برگشت'),
                )
              ],
            ),
          ),
        )
    );
  }

}