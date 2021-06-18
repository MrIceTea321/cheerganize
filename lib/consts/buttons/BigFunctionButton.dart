import 'package:auto_size_text/auto_size_text.dart';
import 'package:cheerganize/screens/HomeScreen.dart';

import 'package:flutter/material.dart';

import '../Constants.dart';

// ignore: must_be_immutable
class BigFunctionButton extends StatelessWidget {
  BigFunctionButton({
    @required this.text,
    @required this.onPress,
    @required this.marginLTRB,
    this.width,
    this.height,
  });

  final String text;
  final Function onPress;
  final List<double> marginLTRB;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Container(
        width: (width == null) ? width = 300.0 : this.width,
        height: (height == null) ? height = 80.0 : this.height,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: HomeScreenButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.fromLTRB(marginLTRB.elementAt(0), marginLTRB
            .elementAt(1),
            marginLTRB.elementAt(2), marginLTRB.elementAt(3)),
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
