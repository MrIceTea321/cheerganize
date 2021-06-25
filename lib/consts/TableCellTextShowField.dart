import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

class TableCellTextShowField extends StatelessWidget {
  TableCellTextShowField({@required this
      .hintText, @required this.controller});

  final String hintText;
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BlackPawsColor,
      child: TextField(
        readOnly: true,
        controller: controller,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Antonio-VariableFont',
        ),
        decoration: InputDecoration(
          hintText: hintText,
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
    );
  }
}
