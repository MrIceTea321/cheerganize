import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import '../Constants.dart';

class RoutineButton extends StatelessWidget {
  RoutineButton({
    @required this.text,
    @required this.onPress,
  });

  final String text;
  final Function onPress;

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
            style: RoutineButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: BlackPawsColor,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
