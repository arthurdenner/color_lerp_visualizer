import 'package:color_lerp_visualizer/widgets/ColorButton.dart';
import 'package:flutter/material.dart';

class PickerTypeSwitch extends StatelessWidget {
  const PickerTypeSwitch({
    Key key,
    @required this.onChanged,
    this.value,
  })  : assert(onChanged != null),
        super(key: key);

  final ValueChanged<PickerType> onChanged;
  final PickerType value;

  static final _options = [
    DropdownMenuItem<PickerType>(
      value: PickerType.BLOCK,
      child: Text('Block'),
    ),
    DropdownMenuItem<PickerType>(
      value: PickerType.DEFAULT,
      child: Text('Default'),
    ),
    DropdownMenuItem<PickerType>(
      value: PickerType.MATERIAL,
      child: Text('Material'),
    ),
    DropdownMenuItem<PickerType>(
      value: PickerType.SLIDER,
      child: Text('Slider'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: _options,
      onChanged: onChanged,
      value: value,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8),
        labelText: 'Type of the color picker',
      ),
    );
  }
}
