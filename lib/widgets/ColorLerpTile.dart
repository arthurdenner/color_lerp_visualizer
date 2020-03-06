import 'package:color_lerp_visualizer/models/EntryColor.dart';
import 'package:color_lerp_visualizer/widgets/ColorText.dart';
import 'package:flutter/material.dart';

class ColorLerpTile extends StatelessWidget {
  const ColorLerpTile({
    Key key,
    @required this.color,
  })  : assert(color != null),
        super(key: key);

  final EntryColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.value,
      child: ListTile(
        dense: true,
        title: ColorText(
          color: color.value,
          text: '${color.key} → ${color.value}',
        ),
      ),
    );
  }
}
