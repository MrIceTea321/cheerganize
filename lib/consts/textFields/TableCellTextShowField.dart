import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class TableCellTextShowField extends StatefulWidget {
  String hintText;
  int durationInSeconds;
  Color color;

  TableCellTextShowField({ Key key, this.hintText, this.durationInSeconds,
    this.color }):super(key: key);

  @override
  _TableCellTextShowFieldState createState() => _TableCellTextShowFieldState();
}

class _TableCellTextShowFieldState extends State<TableCellTextShowField> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
    new AnimationController(vsync: this, duration: Duration(seconds:
    widget.durationInSeconds));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Container(
        color: BlackPawsColor,
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
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
