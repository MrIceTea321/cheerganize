import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

class TableCellTextField extends StatelessWidget {
  TableCellTextField({@required this.onSubmitted});

  final Function onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BlackPawsColor,
      child: TextField(
        textAlign: TextAlign.center,
        onSubmitted: onSubmitted,
        style: BlackPawsTextFieldTextStyle,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: BlackPawsColor, width: 3.0),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: BlackPawsColor, width: 3.0),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: BlackPawsColor, width: 3.0),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
      ),
    );
  }
}
