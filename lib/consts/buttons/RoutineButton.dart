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
        width: 250.0,
        height: 60.0,
        child: Center(
          child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            style: RoutineButtonTextStyle,
            stepGranularity: 1.5,
            softWrap: true,
          ),
        ),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: CheerganizeYellowColor,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
