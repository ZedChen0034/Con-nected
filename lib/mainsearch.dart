import 'package:flutter/material.dart';
import 'Search_page.dart';
import 'main for search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connected',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(), // 设置MainPage为主屏幕
    );
  }
}
