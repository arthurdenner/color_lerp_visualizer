import 'package:color_lerp_visualizer/widgets/ColorText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

enum PickerType { BLOCK, DEFAULT, MATERIAL, SLIDER }

class ColorButton extends StatelessWidget {
  const ColorButton({
    Key key,
    @required this.color,
    @required this.onColorChanged,
    @required this.text,
    this.type = PickerType.DEFAULT,
  })  : assert(color != null),
        assert(onColorChanged != null),
        assert(text != null),
        super(key: key);

  final Color color;
  final ValueChanged<Color> onColorChanged;
  final String text;
  final PickerType type;

  Widget _buildPicker() {
    switch (type) {
      case PickerType.BLOCK:
        return BlockPicker(
          onColorChanged: onColorChanged,
          pickerColor: color,
        );
      case PickerType.SLIDER:
        return SlidePicker(
          displayThumbColor: true,
          onColorChanged: onColorChanged,
          paletteType: PaletteType.hsl,
          pickerColor: color,
        );
      case PickerType.MATERIAL:
        return MaterialPicker(
          enableLabel: true,
          onColorChanged: onColorChanged,
          pickerColor: color,
        );
      default:
        return ColorPicker(
          displayThumbColor: true,
          onColorChanged: onColorChanged,
          paletteType: PaletteType.hsl,
          pickerColor: color,
        );
    }
  }

  void _changeColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0.0),
          contentPadding: const EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: _buildPicker(),
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
