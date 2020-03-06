import 'package:color_lerp_visualizer/widgets/ColorButton.dart';
import 'package:color_lerp_visualizer/widgets/ColorLerps.dart';
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
      home: MyHomePage(title: 'Color.lerp visualizer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _begin = Colors.green;
  Color _end = Colors.orange;
  double _gap = 0.25;

  void _onChangeGap(double value) {
    if (value == 0) {
      return;
    }

    setState(() => _gap = value);
  }

  void _changeBeginColor(Color value) {
    setState(() => _begin = value);
  }

  void _changeEndColor(Color value) {
    setState(() => _end = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 8),
            ColorButton(
              color: _begin,
              onColorChanged: _changeBeginColor,
              text: 'begin: $_begin',
            ),
            SizedBox(height: 8),
            ColorButton(
              color: _end,
              onColorChanged: _changeEndColor,
              text: 'end: $_end',
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Slider.adaptive(
                divisions: 100,
                label: '$_gap',
                onChanged: _onChangeGap,
                value: _gap,
              ),
            ),
            ColorLerps(
              begin: _begin,
              end: _end,
              gap: _gap,
            ),
          ],
        ),
      ),
    );
  }
}
