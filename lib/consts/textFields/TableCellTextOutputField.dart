import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class TableCellTextOutputField extends StatelessWidget {
  TableCellTextOutputField(
      {@required this.onChanged,
      @required this.hintText,
      @required this.controller});

  final Function onChanged;
  final String hintText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CheerganizeYellowColor,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        onSubmitted: onChanged,
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Antonio-VariableFont',
        ),
        decoration: InputDecoration(
          hintText: hintText ,
          hintStyle: TextStyle(
            color: BasicBlackColor,
            fontSize: 20.0,
            fontFamily: 'Antonio-VariableFont',
          ),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: CheerganizeYellowColor, width: 3.0),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CheerganizeYellowColor, width: 3.0),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CheerganizeYellowColor, width: 3.0),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
      ),
    );
  }
}
