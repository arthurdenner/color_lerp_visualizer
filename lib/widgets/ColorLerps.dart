import 'package:color_lerp_visualizer/models/EntryColor.dart';
import 'package:color_lerp_visualizer/widgets/ColorText.dart';
import 'package:flutter/material.dart';

double formatDouble(double value) {
  return double.parse(value.toStringAsFixed(2));
}

class ColorLerps extends StatelessWidget {
  const ColorLerps({
    Key key,
    @required this.begin,
    @required this.end,
    @required this.gap,
  })  : assert(begin != null),
        assert(end != null),
        assert(gap != null),
        super(key: key);

  final Color begin;
  final Color end;
  final double gap;

  List<EntryColor> _computeColors() {
    List<EntryColor> _colors = [];

    _colors.add(
      EntryColor(
        key: 'Color.lerp(begin, end, 0.0)',
        value: Color.lerp(begin, end, 0),
      ),
    );

    for (var _t = gap; _t < 1; _t = formatDouble(_t + gap)) {
      _colors.add(
        EntryColor(
          key: 'Color.lerp(begin, end, $_t)',
          value: Color.lerp(begin, end, _t),
        ),
      );
    }

    _colors.add(
      EntryColor(
        key: 'Color.lerp(begin, end, 1.0)',
        value: Color.lerp(begin, end, 1),
      ),
    );

    return _colors;
  }

  @override
  Widget build(BuildContext context) {
    final _colors = _computeColors();

    return Expanded(
      child: ListView.separated(
        itemCount: _colors.length,
        padding: EdgeInsets.only(bottom: 8),
        separatorBuilder: (_, __) => SizedBox(height: 8),
        itemBuilder: (_, index) {
          final _color = _colors[index];

          return Container(
            color: _color.value,
            child: ListTile(
              dense: true,
              title: ColorText(
                color: _color.value,
                text: '${_color.key} → ${_color.value}',
              ),
            ),
          );
        },
      ),
    );
  }
}
