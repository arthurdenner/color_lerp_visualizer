import 'package:color_lerp_visualizer/utils/Debouncer.dart';
import 'package:color_lerp_visualizer/widgets/ColorButton.dart';
import 'package:color_lerp_visualizer/widgets/ColorLerps.dart';
import 'package:color_lerp_visualizer/widgets/PickerTypeSwitch.dart';
import 'package:flutter/material.dart';
import 'package:undo/undo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _begin = Colors.white;
  Color _end = Colors.black;
  double _gap = 0.25;
  PickerType _type = PickerType.DEFAULT;

  final _changes = ChangeStack();
  final _debouncer = Debouncer();

  void _onChangeGap(double value) {
    if (value == 0) {
      return;
    }

    setState(() => _gap = value);
  }

  void _commitBeginChange(Color newValue) {
    if (newValue != _begin) {
      final _currentValue = _begin;

      _changes.add(
        new Change.inline(
          () => _begin = newValue,
          () => _begin = _currentValue,
        ),
      );
    }
  }

  void _commitEndChange(Color newValue) {
    if (newValue != _end) {
      final _currentValue = _end;

      _changes.add(
        new Change.inline(
          () => _end = newValue,
          () => _end = _currentValue,
        ),
      );
    }
  }

  void _changeBeginColor(Color value) {
    _debouncer.run(
      () {
        _commitBeginChange(value);
        setState(() => _begin = value);
      },
    );
  }

  void _changeEndColor(Color value) {
    _debouncer.run(
      () {
        _commitEndChange(value);
        setState(() => _end = value);
      },
    );
  }

  void _changePickerType(PickerType value) {
    setState(() => _type = value);
  }

  List<Widget> _buildActions() {
    return [
      Row(
        children: <Widget>[
          IconButton(
            tooltip: 'Undo color changes',
            icon: Icon(Icons.undo),
            onPressed: !_changes.canUndo
                ? null
                : () => setState(() => _changes.undo()),
          ),
          IconButton(
            tooltip: 'Redo color changes',
            icon: Icon(Icons.redo),
            onPressed: !_changes.canRedo
                ? null
                : () => setState(() => _changes.redo()),
          ),
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _buildActions(),
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
              Slider.adaptive(
                divisions: 100,
                label: '$_gap',
                onChanged: _onChangeGap,
                value: _gap,
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
