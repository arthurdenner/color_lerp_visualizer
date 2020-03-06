import 'package:color_lerp_visualizer/pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color.lerp visualizer',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black54,
        ),
        primarySwatch: Colors.grey,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
