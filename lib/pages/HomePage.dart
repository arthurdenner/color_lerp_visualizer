import 'package:color_lerp_visualizer/widgets/ColorButton.dart';
import 'package:color_lerp_visualizer/widgets/ColorLerps.dart';
import 'package:color_lerp_visualizer/widgets/PickerTypeSwitch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _begin = Colors.green;
  Color _end = Colors.orange;
  double _gap = 0.25;
  PickerType _type = PickerType.DEFAULT;

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

  void _changePickerType(PickerType value) {
    setState(() => _type = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color.lerp visualizer'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PickerTypeSwitch(
                onChanged: _changePickerType,
                value: _type,
              ),
              ColorButton(
                color: _begin,
                onColorChanged: _changeBeginColor,
                text: 'begin: $_begin',
                type: _type,
              ),
              SizedBox(height: 8),
              ColorButton(
                color: _end,
                onColorChanged: _changeEndColor,
                text: 'end: $_end',
                type: _type,
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
      ),
    );
  }
}
