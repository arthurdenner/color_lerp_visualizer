import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  _openSourceCode(BuildContext context) async {
    const url = 'https://github.com/arthurdenner/color_lerp_visualizer';
    final canOpenUrl = await canLaunch(url);

    if (canOpenUrl) {
      await launch(url);
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Couldn't open source code"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Created with ❤️ by @arthurdenner'),
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Ionicons.logo_github),
            tooltip: 'See source code',
            onPressed: () => _openSourceCode(context),
          ),
        ],
      ),
    );
  }
}
