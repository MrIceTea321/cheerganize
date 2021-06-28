import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class SmallRoundedContainer extends StatelessWidget {
  SmallRoundedContainer({@required this.prefix, @required this.suffix});

  final String prefix;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 80.0,
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
      child: TextField(
        readOnly: true,
        textAlign: TextAlign.center,
        style: CheerganizeTextFieldTextStyle,
        decoration: InputDecoration(
          hintText: prefix + suffix,
          hintStyle: CheerganizeTextFieldTextStyle,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CheerganizeYellowColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CheerganizeYellowColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}
