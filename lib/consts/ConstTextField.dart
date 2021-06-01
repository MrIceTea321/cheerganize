import 'package:cheerganize/consts/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstTextField extends StatelessWidget {
  ConstTextField(
      {@required this.hintText,
      @required this.onSubmitted});

  final String hintText;
  final Function onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        onSubmitted: onSubmitted,
        style: BlackPawsTextFieldTextStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: BlackPawsTextFieldTextStyle,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: BlackPawsColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: BlackPawsColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}
