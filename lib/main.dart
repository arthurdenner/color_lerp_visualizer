import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class EntryColor {
  EntryColor({
    @required this.key,
    @required this.value,
  });

  final String key;
  final Color value;
}

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
  double _gap = .1;
  List<EntryColor> _colors = [];

  @override
  void initState() {
    super.initState();
    _computeColors();
  }

  void _computeColors() {
    List<EntryColor> _newColors = [];

    for (var i = 0.0; i <= 1; i += _gap) {
      final _t = i.toStringAsFixed(2);

      _newColors.add(
        EntryColor(
          key: 'Color.lerp(begin, end, $_t)',
          value: Color.lerp(_begin, _end, double.parse(_t)),
        ),
      );
    }

    setState(() {
      _colors = _newColors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 8),
          itemCount: _colors.length,
          separatorBuilder: (_, __) => SizedBox(height: 8),
          itemBuilder: (_, index) {
            final _color = _colors[index];

            return Container(
              color: _color.value,
              child: ListTile(
                title: Text('${_color.key} → ${_color.value}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
