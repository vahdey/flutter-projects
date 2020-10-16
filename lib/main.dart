import 'package:flutter/material.dart';
import 'package:whatsapp/pages/create_chat_screen.dart';
import 'package:whatsapp/pages/setting_screen.dart';
import 'package:whatsapp/pages/splash_screen.dart';
import 'package:whatsapp/whatsapp_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'WhatsApp',
        theme: ThemeData(
            fontFamily: 'Vazir',
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primaryColor: new Color(0xff075E54),
            accentColor:  new Color(0xff25d366)
        ),
        initialRoute: "/splash_screen",
        routes: {
          "/" : (context) => new Directionality(textDirection: TextDirection.rtl, child: WhatsAppHome()),
          "/splash_screen" : (context) => new Directionality(textDirection: TextDirection.rtl, child: new SplashScreen()),
          "/setting" : (context) => new SettingScreen(),
          "/new_chat" : (context) => new CreateChatScreen()
        },
        debugShowCheckedModeBanner: false,
    );
  }
}