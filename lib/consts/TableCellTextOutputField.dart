import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

class TableCellTextOutputField extends StatelessWidget {
  TableCellTextOutputField({@required this.onSubmitted, @required this.hintText});

  final Function onSubmitted;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BlackPawsColor,
      child: TextField(
        textAlign: TextAlign.center,
        onSubmitted: onSubmitted,
        style: BlackPawsTextFieldTableTextStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: BlackPawsTextFieldTextStyle,
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
