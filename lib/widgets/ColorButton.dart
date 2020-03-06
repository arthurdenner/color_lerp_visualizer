import 'package:color_lerp_visualizer/widgets/ColorText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    Key key,
    @required this.color,
    @required this.onColorChanged,
    @required this.text,
  })  : assert(color != null),
        assert(onColorChanged != null),
        assert(text != null),
        super(key: key);

  final Color color;
  final ValueChanged<Color> onColorChanged;
  final String text;

  void _changeColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0.0),
          contentPadding: const EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: color,
              onColorChanged: onColorChanged,
              colorPickerWidth: 300.0,
              pickerAreaHeightPercent: 0.7,
              enableAlpha: true,
              displayThumbColor: true,
              showLabel: true,
              paletteType: PaletteType.hsv,
              pickerAreaBorderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(2.0),
                topRight: const Radius.circular(2.0),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: RaisedButton(
        color: color,
        child: ColorText(
          color: color,
          text: text,
        ),
        onPressed: () => _changeColor(context),
      ),
    );
  }
}
