import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class TableCellTextShowField extends StatefulWidget {
  String hintText;
  AnimationController controller;

  TableCellTextShowField({Key key, @required this.hintText, this.controller})
      : super(key: key);

  @override
  _TableCellTextShowFieldState createState() => _TableCellTextShowFieldState();
}

class _TableCellTextShowFieldState extends State<TableCellTextShowField>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BlackPawsColor,
      child: FadeTransition(
        alwaysIncludeSemantics: true,
        opacity: widget.controller,
        child: TextField(
          readOnly: true,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Antonio-VariableFont',
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: BasicBlackColor,
              fontSize: 20.0,
              fontFamily: 'Antonio-VariableFont',
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
      ),
    );
  }
}
