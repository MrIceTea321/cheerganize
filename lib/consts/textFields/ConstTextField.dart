import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class ConstTextField extends StatelessWidget {
  ConstTextField({@required this.hintText, @required this.onChanged});

  final String hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
      child: TextField(
        textAlign: TextAlign.center,
        onChanged: onChanged,
        style: CheerganizeTextFieldTextStyle,
        decoration: InputDecoration(
          hintText: hintText,
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
