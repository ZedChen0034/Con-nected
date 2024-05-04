import 'package:con_nected/Help/GuideVideo.dart';
import 'package:flutter/material.dart';
import 'welcome.dart';
import 'login.dart';
import 'register.dart';
import 'homePage.dart';
import 'package:con_nected/Event/createevent.dart';
import 'Event/calendar.dart';
import 'Event/detail.dart';
import 'peer.dart';
import 'package:con_nected/Event/doneevent.dart';
import 'help.dart';
import 'Help/chat.dart';
import 'Help/DocumentDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Con-nected',
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => HomePage(),
        '/calendar': (context) => const Calendar(),
        '/createEvent': (context) => Createevent(),
        '/doneEvent': (context) => Doneevent(),
        '/detail': (context) => Detail(),
        '/help': (context) => Help(),
        '/chat': (context) => Chat(),
        '/documentDetail': (context) => DocumentDetail(),
        '/peer': (context) => Peer(),
        '/guideVideo': (context) => GuideVideo(),
      },
    );
  }
}
