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
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.button.merge(
            TextStyle(
              color: _getTextColor(color),
            ),
          ),
    );
  }
}
