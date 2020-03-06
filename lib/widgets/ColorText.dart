import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

Color _getTextColor(Color color) {
  return TinyColor(color).isDark() ? Colors.white : Colors.black;
}

class ColorText extends StatelessWidget {
  const ColorText({
    Key key,
    @required this.color,
    @required this.text,
  })  : assert(color != null),
        assert(text != null),
        super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: _getTextColor(color),
      ),
    );
  }
}
