import 'package:color_lerp_visualizer/models/EntryColor.dart';
import 'package:color_lerp_visualizer/widgets/ColorButton.dart';
import 'package:color_lerp_visualizer/widgets/ColorText.dart';
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

double formatDouble(double value) {
  return double.parse(value.toStringAsFixed(2));
}

class _MyHomePageState extends State<MyHomePage> {
  Color _begin = Colors.green;
  Color _end = Colors.orange;
  double _gap = 0.25;

  List<EntryColor> _computeColors() {
    List<EntryColor> _colors = [];

    _colors.add(
      EntryColor(
        key: 'Color.lerp(begin, end, 0.0)',
        value: Color.lerp(_begin, _end, 0),
      ),
    );

    for (var _t = _gap; _t < 1; _t = formatDouble(_t + _gap)) {
      _colors.add(
        EntryColor(
          key: 'Color.lerp(begin, end, $_t)',
          value: Color.lerp(_begin, _end, _t),
        ),
      );
    }

    _colors.add(
      EntryColor(
        key: 'Color.lerp(begin, end, 1.0)',
        value: Color.lerp(_begin, _end, 1),
      ),
    );

    return _colors;
  }

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
    final _colors = _computeColors();

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
            Expanded(
              child: ListView.separated(
                itemCount: _colors.length,
                padding: EdgeInsets.only(bottom: 8),
                separatorBuilder: (_, __) => SizedBox(height: 8),
                itemBuilder: (_, index) {
                  final _color = _colors[index];

                  return Container(
                    color: _color.value,
                    child: ListTile(
                      title: ColorText(
                        color: _color.value,
                        text: '${_color.key} → ${_color.value}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
