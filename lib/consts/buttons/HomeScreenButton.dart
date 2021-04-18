import 'package:auto_size_text/auto_size_text.dart';
import 'package:cheerganize/screens/HomeScreen.dart';

import 'package:flutter/material.dart';

import '../Constants.dart';

class HomeScreenButton extends StatelessWidget {
  HomeScreenButton({
    @required this.text,
    @required this.onPress,
    @required this.margin,
  });

  final String text;
  final Function onPress;
  final List<double> margin;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Container(
        width: 300.0,
        height: 80.0,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: HomeScreenButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.fromLTRB(margin.elementAt(0), margin.elementAt(1),
            margin.elementAt(2), margin.elementAt(3)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: BlackPawsColor,
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
