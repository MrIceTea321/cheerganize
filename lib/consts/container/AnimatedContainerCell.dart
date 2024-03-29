import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class AnimatedContainerCell extends StatefulWidget {
  String hintText;
  int durationInMillSec;
  bool selected = true;
  int delayValue = 7000;

  AnimatedContainerCell(
      {Key key, @required this.hintText, @required this.durationInMillSec})
      : super(key: key);

  @override
  _AnimatedContainerCell createState() => _AnimatedContainerCell();
}

class _AnimatedContainerCell extends State<AnimatedContainerCell>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(
        Duration(milliseconds: widget.durationInMillSec + widget.delayValue),
        () {
      if (mounted) {
        setState(() {
          widget.selected = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.black87;
    return AnimatedContainer(
      duration: Duration(milliseconds: widget.durationInMillSec),
      color: CheerganizeYellowColor,
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
            borderSide: BorderSide(
                color: widget.selected ? CheerganizeYellowColor : borderColor,
                width: widget.selected ? 2.0 : 3.0),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.selected ? CheerganizeYellowColor : borderColor,
                width: widget.selected ? 2.0 : 3.0),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.selected ? CheerganizeYellowColor : borderColor,
                width: widget.selected ? 2.0 : 3.0),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
      ),
    );
  }
}
