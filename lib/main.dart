import 'package:flutter/material.dart';
import 'package:meizuplayerclone/screens/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.grey[600],
            ),
            headline2: TextStyle(
              color: Colors.grey[600],
            ),
            headline3: TextStyle(
              color: Colors.grey[600],
            ),
            headline4: TextStyle(
              color: Colors.grey[600],
            ),
            headline5: TextStyle(
              color: Colors.grey[600],
            ),
            headline6: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ),
      ),
      home: MainIndexPage(),
    );
  }
}
