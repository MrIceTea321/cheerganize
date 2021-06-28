import 'package:Cheerganize/consts/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableCellTextField extends StatelessWidget {
  TableCellTextField({@required this.onSubmitted, this.controller, this.hintText});

  final Function onSubmitted;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CheerganizeYellowColor,
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        onSubmitted: onSubmitted,
        style: CheerganizeTextFieldTableTextStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
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