import 'package:color_lerp_visualizer/pages/HomePage.dart';
import 'package:color_lerp_visualizer/utils/CustomTrackShape.dart';
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
          color: Colors.black45,
          elevation: 2,
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        primarySwatch: Colors.grey,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
          ),
        ),
        sliderTheme: SliderThemeData(
          trackShape: CustomTrackShape(),
        ),
      ),
      home: HomePage(),
    );
  }
}
